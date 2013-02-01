require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    Stripe.api_key = 'sk_test_MEOI9a9zOelkZmmDUq3ib7qC'
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

  test "Should populate credit card info when a logged in user has a stripe_customer_id" do
    set_full_cart_cookie
    sign_in :user, users(:user_with_stripe)
    get :new
    assert_select 'form #card_number' do
      assert_select '[value=?]', /.+/
    end
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
    bad_user_params = user_params
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

  test "Existing customer, successfully placed order with saved card" do
    set_full_cart_cookie
    user = users(:user_with_stripe)
    order_count = user.orders.count
    sign_in :user, user
    post :create, {
      order: order_params,
      use_saved_card: 'on'
    }
    assert_response :success
    assert_template :thank_you
    assert_equal assigns(:order).line_items.count, 2
    assert_not_nil assigns(:order).stripe_charge_id
    assert_equal user.orders.count, order_count + 1
  end

  test "Existing customer, successfully placed order with saved card and a 10% discount in California" do
    set_full_cart_cookie
    user = users(:user_with_stripe)
    coupon = coupons(:ten_percent_off)
    coupon_quantity = coupon.quantity
    sign_in :user, user
    post :create, {
        order: order_params,
        use_saved_card: 'on',
        coupon_code: 'BQTHRSCA'
    }
    assert_response :success
    assert_template :thank_you
    assert_not_nil assigns(:order).coupon
    assert_equal assigns(:order).coupon.description, '10% Off Promotion'
    assert_equal assigns(:order).tax, 61.4
    assert_equal assigns(:order).final_cost, 743.6
    assert_equal assigns(:order).discount, 75.8
    coupon.reload
    assert_equal coupon.quantity, coupon_quantity - 1
  end

  test "Existing customer, successfully placed order with saved card and a 10% discount outside of California" do
    set_full_cart_cookie
    user = users(:user_with_stripe)
    coupon = coupons(:ten_percent_off)
    coupon_quantity = coupon.quantity
    sign_in :user, user
    params = order_params
    params[:shipping_address_attributes][:state] = 'MA'
    post :create, {
        order: params,
        use_saved_card: 'on',
        coupon_code: 'BQTHRSCA'
    }
    assert_response :success
    assert_template :thank_you
    assert_not_nil assigns(:order).coupon
    assert_equal assigns(:order).coupon.description, '10% Off Promotion'
    assert_equal assigns(:order).tax, 0
    assert_equal assigns(:order).final_cost, 682.2
    assert_equal assigns(:order).discount, 75.8
    coupon.reload
    assert_equal coupon.quantity, coupon_quantity - 1
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
