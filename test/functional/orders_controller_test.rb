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

  test "Should redirect to measurements when no measurements are present for in session for non-logged user" do
    set_full_cart_cookie
    get :new
    assert_response :redirect
    assert_redirected_to '/measurements'
  end

  test "Should redirect to measurements when an existing user has no measurements" do
    user = users(:user_without_stripe)
    user.measurement = nil
    user.save
    sign_in :user, user
    set_full_cart_cookie
    get :new
    assert_response :redirect
    assert_redirected_to '/measurements'
  end

  test "New customer, successfully posted to review" do
    set_full_cart_cookie
    post :review, {
      user: user_params,
      order: order_params,
      stripe_card_token: 'tok_17p90hyqwrWF2b',
      card_last_4: '1117',
      card_exp_month: '1',
      card_exp_year: '2013',
      save_card_for_later: 'on'
    }, { measurement_id: 1 }
    assert_response :success
    assert_template :review
  end

  test "New customer, bad user data posted to review" do
    set_full_cart_cookie
    bad_user_params = user_params()
    bad_user_params[:password_confirmation] = 'foo'
    post :review, {
        user: bad_user_params,
        order: order_params,
        stripe_card_token: 'tok_17p90hyqwrWF2b',
        card_last_4: '1117',
        card_exp_month: '1',
        card_exp_year: '2013',
        save_card_for_later: 'on'
    }, { measurement_id: 1 }
    assert_response :success
    assert_template :new
    assert assigns(:user).errors.any?
    assert assigns(:user).errors.messages.has_key?(:password)
  end

  test "Existing customer, successfully posted to review" do
    set_full_cart_cookie
    user = users(:user_without_stripe)
    sign_in :user, user
    post :review, {
      order: order_params,
      stripe_card_token: 'tok_17p90hyqwrWF2b',
      card_last_4: '1117',
      card_exp_month: '1',
      card_exp_year: '2013',
      save_card_for_later: 'on'
    }
    assert_response :success
    assert_template :review
    assert !assigns(:order).line_items.empty?
    assert_equal assigns(:order).measurement.chest, user.measurement.chest
  end

  def user_params
    { name: 'Jordan', email: 'test500@test.com', password: 'abc123', password_confirmation: 'abc123' }
  end

  def order_params
    {
      shipping_address_attributes: {
          name: 'Jordan Brown', line1: '11 Downey St.', city: 'San Francisco', state: 'CA', zip: 94041
      },
      billing_address_attributes: {
          name: 'Jordan Brown', line1: '11 Downey St.', city: 'San Francisco', state: 'CA', zip: 94041
      },
    }
  end
end
