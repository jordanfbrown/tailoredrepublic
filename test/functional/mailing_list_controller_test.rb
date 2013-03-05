require 'test_helper'

class MailingListControllerTest < ActionController::TestCase
  test "should be able to subscribe to the mailing list" do
    Gibbon.expects(:list_subscribe).with({id: GIBBON_LIST_ID, email_address: 'jordanfbrown@gmail.com'}).returns(true)
    post :subscribe, email: 'jordanfbrown@gmail.com'
    assert_response :success
    assert json_response['success']
  end

  test "if the Gibbon subscribe method fails it should throw a 500 error" do
    Gibbon.expects(:list_subscribe).with({id: GIBBON_LIST_ID, email_address: 'jordanfbrown@gmail.com'}).returns(false)
    post :subscribe, email: 'jordanfbrown@gmail.com'
    assert_response :error
    assert !json_response['success']
  end

  test "if no email is passed it should throw a 500 error" do
    post :subscribe, email: ''
    assert_response :error
    assert !json_response['success']
  end
end
