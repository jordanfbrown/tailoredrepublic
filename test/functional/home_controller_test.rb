require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  setup do
    @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials('tailored', 'sodamnclean!')
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
