require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  setup do
    set_basic_auth_credentials
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
