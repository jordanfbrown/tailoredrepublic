require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    set_basic_auth_credentials
  end

  test "Should set @stripe_customer when a logged in user has a stripe_customer_id" do
    set_full_cart_cookie
    sign_in :user, users(:user_with_stripe)
    get :new
    assert_response :success
    assert_not_nil assigns(:stripe_customer)
  end

  test "Shouldn't set @stripe_customer when a logged in user doesn't have a stripe_customer_id" do
    set_full_cart_cookie
    sign_in :user, users(:user_without_stripe)
    get :new
    assert_response :success
    assert_nil assigns(:stripe_customer)
  end

  test "Should redirect to shop when cart is empty" do
    set_empty_cart_cookie
    sign_in :user, users(:user_without_stripe)
    get :new
    assert_response :redirect
    assert_redirected_to '/shop'
  end

end
