require 'test_helper'

class TapeMeasureRequestsControllerTest < ActionController::TestCase
  setup do
    @tape_measure_params = {
      email: 'jordan@tailoredrepublic.com',
      shipping_address_attributes: {
        name: 'Jordan Brown', line1: '11 Downey St.', city: 'San Francisco', state: 'CA', zip: 94041
      }
    }
  end

  test "an admin should be able to get index" do
    sign_in :user, users(:admin)
    get :index
    assert_response :success
    assert_template :index
  end

  test "an unauthorized user should not be able to get index" do
    get :index
    assert_response :redirect
  end

  test "a signed in user who gets new should have their shipping address and email prepopulated" do
    user = users(:user_with_stripe)
    sign_in :user, user
    get :new
    assert_response :success
    assert_template :new
    assert_equal assigns(:tape_measure_request).shipping_address, user.shipping_address
    assert_equal assigns(:tape_measure_request).email, user.email
  end

  test "the shipping address should be built correctly for a non-signed in user" do
    get :new
    assert_response :success
    assert_template :new
    assert_not_nil assigns(:tape_measure_request)
    assert_not_nil assigns(:tape_measure_request).shipping_address
  end

  test "should be to create a tape measure request" do
    ip_address = '127.0.0.1'
    @request.env['REMOTE_ADDR'] = ip_address
    post :create, tape_measure_request: @tape_measure_params, subscribe_to_mailing_list: '0'
    assert_response :redirect
    assert_redirected_to :thank_you_tape_measure_requests
    assert_equal assigns(:tape_measure_request).shipping_address.line1,
                 @tape_measure_params[:shipping_address_attributes][:line1]
    assert_equal assigns(:tape_measure_request).ip_address, ip_address
    assert_equal session[:requested_tape_measure], true
  end

  test "a bad address should prevent a tape measure request from succeeding" do
    bad_params = @tape_measure_params
    bad_params[:shipping_address_attributes][:line1] = ''
    post :create, tape_measure_request: bad_params, subscribe_to_mailing_list: '0'
    assert_response :success
    assert_template :new
    assert assigns(:tape_measure_request).errors.any?
  end

  test "an admin should be able to update a tape measure request" do
    sign_in :user, users(:admin)
    tape_measure_request = tape_measure_requests(:jordan)
    assert_equal tape_measure_request.sent, false
    put :update, id: tape_measure_request.id, tape_measure_request: { sent: true }
    assert_response :success
    tape_measure_request.reload
    assert_equal tape_measure_request.sent, true
  end

  test "a non-admin should not be able to update a tape measure request" do
    tape_measure_request = tape_measure_requests(:jordan)
    put :update, id: tape_measure_request.id, tape_measure_request: { sent: true }
    assert_response :redirect
  end
end