require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    set_basic_auth_credentials
  end

  test "Should set @stripe_customer when a logged in user has a stripe_customer_id" do
    sign_in :user, users(:user_with_stripe)
    @request.cookie_jar.signed[:cart_id] = 1
    get :new
    assert_response :success
    assert_not_nil assigns(:stripe_customer)
  end

end
