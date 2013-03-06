require 'test_helper'

class ScheduleTailorRequestsControllerTest < ActionController::TestCase
  test "an unauthorized user shouldn't be able to get index" do
    get :index
    assert_response :redirect
  end

  test "an authorized user should be able to get index" do
    sign_in :user, users(:admin)
    get :index
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:schedule_tailor_requests)
    assert_not_nil assigns(:filter)
  end

  test "anyone should be able to get the form for a new schedule tailor request" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "a logged in user should have email, name, and zip prepopulated on the new schedule tailor request form" do
    user = users(:admin)
    sign_in :user, user
    get :new
    assert_equal assigns(:schedule_tailor_request).email, user.email
    assert_equal assigns(:schedule_tailor_request).name, user.name
    assert_equal assigns(:schedule_tailor_request).zip, user.shipping_address.zip
  end

  test "should be a create a new schedule tailor request" do
    ip_address = '127.0.0.1'
    @request.env['REMOTE_ADDR'] = ip_address
    request_params = {
      name: 'Jordan',
      email: 'jordanfbrown@gmail.com',
      zip: '94041'
    }
    post :create, schedule_tailor_request: request_params, subscribe_to_mailing_list: '0'
    assert_response :redirect
    assert_redirected_to '/shop/suits'
    assert_equal assigns(:schedule_tailor_request).ip_address, ip_address
    assert_equal assigns(:schedule_tailor_request).name, request_params[:name]
  end

  test "a request to schedule a tailor with bad params should fail" do
    ip_address = '127.0.0.1'
    @request.env['REMOTE_ADDR'] = ip_address
    request_params = {
      name: 'Jordan',
      email: '',
      zip: '94041'
    }
    post :create, schedule_tailor_request: request_params, subscribe_to_mailing_list: '0'
    assert_response :success
    assert_template :new
    assert assigns(:schedule_tailor_request).errors.any?
  end

  #test "should be able to update a schedule tailor request's status" do
  #  tailor_request = schedule_tailor_requests(:schedule_tailor_request_one)
  #  put :update, id: tailor_request.id, schedule_tailor_request: { status: 'scheduled' }
  #  puts assigns(:schedule_tailor_request).errors.inspect
  #  assert_equal assigns(:schedule_tailor_request).status, 'scheduled'
  #  assert_response :success
  #end
end
