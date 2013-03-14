require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    Stripe.api_key = 'sk_test_MEOI9a9zOelkZmmDUq3ib7qC'
    @order_params = {
      shipping_address_attributes: {
        name: 'Jordan Brown', line1: '11 Downey St.', city: 'San Francisco', state: 'CA', zip: 94041
      },
      billing_address_attributes: {
        name: 'Jordan Brown', line1: '11 Downey St.', city: 'San Francisco', state: 'CA', zip: 94041
      },
    }
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
    assert_redirected_to '/shop/suits'
  end

  test "Should redirect to measurements when no measurements are present in session for non-logged user" do
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

  test "New customer, successfully posted to review, should create a new user" do
    set_full_cart_cookie
    post :review, {
      user: { name: 'Jordan', email: 'test500@test.com', password: 'abc123' },
      order: @order_params,
      stripe_card_token: 'tok_17p90hyqwrWF2b',
      card_last4: '1117',
      card_exp_month: '1',
      card_exp_year: '2020',
      save_card_for_later: 'on'
    }, { measurement_id: 1 }
    assert_response :success
    assert_template :review
    new_user = User.last
    assert_equal new_user.name, 'Jordan'
    assert_equal new_user.email, 'test500@test.com'
  end

  test "New customer, unsuccessfully posted to review, should throw correct error" do
    set_full_cart_cookie
    post :review, {
      user: { name: 'Jordan', email: '', password: 'abc123' },
      order: @order_params,
      stripe_card_token: 'tok_17p90hyqwrWF2b',
      card_last4: '1117',
      card_exp_month: '1',
      card_exp_year: '2020',
      save_card_for_later: 'on'
    }, { measurement_id: 1 }
    assert_response :success
    assert_template :new
    assert assigns(:user).errors.any?
    assert assigns(:user).errors.has_key?(:email)
  end

  test "Existing customer, successfully posted to review" do
    set_full_cart_cookie
    user = users(:user_without_stripe)
    sign_in :user, user
    post :review, {
      order: @order_params,
      stripe_card_token: 'tok_17p90hyqwrWF2b',
      card_last4: '1117',
      card_exp_month: '1',
      card_exp_year: '2013',
      save_card_for_later: 'on'
    }
    assert_response :success
    assert_template :review
    assert !assigns(:order).line_items.empty?
    assert_equal assigns(:order).measurement.chest, user.measurement.chest
  end

  test "Existing customer, successfully placed order with saved card, should redirect to thank you page" do
    set_full_cart_cookie
    user = users(:user_with_stripe)
    order_count = user.orders.count
    sign_in :user, user
    post :create, {
      order: @order_params,
      card_radio: 'use_saved_card'
    }
    assert_response :redirect
    assert_redirected_to :thank_you_orders
    assert session[:order_id] = assigns(:order).id
    assert_equal assigns(:order).line_items.count, 2
    assert_not_nil assigns(:order).order_id
    assert_equal user.orders.count, order_count + 1
  end

  test "Existing customer, successfully placed order with saved card and a 10% discount in California" do
    set_full_cart_cookie
    user = users(:user_with_stripe)
    coupon = coupons(:ten_percent_off)
    coupon_quantity = coupon.quantity
    sign_in :user, user
    post :create, {
        order: @order_params,
        card_radio: 'use_saved_card',
        coupon_code: 'BQTHRSCA'
    }
    assert_response :redirect
    assert_redirected_to :thank_you_orders
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
    params = @order_params
    params[:shipping_address_attributes][:state] = 'MA'
    post :create, {
        order: params,
        card_radio: 'use_saved_card',
        coupon_code: 'BQTHRSCA'
    }
    assert_response :redirect
    assert_redirected_to :thank_you_orders
    assert_not_nil assigns(:order).coupon
    assert_equal assigns(:order).coupon.description, '10% Off Promotion'
    assert_equal assigns(:order).tax, 0
    assert_equal assigns(:order).final_cost, 682.2
    assert_equal assigns(:order).discount, 75.8
    coupon.reload
    assert_equal coupon.quantity, coupon_quantity - 1
  end

  test "When the total cost of an order is $0, an order ID is generated by us instead of Stripe, and the order still
       works correctly" do
    set_one_suit_cart_cookie
    user = users(:user_with_stripe)
    sign_in :user, user
    params = @order_params
    post :create, {
      order: params,
      card_radio: 'use_saved_card',
      coupon_code: 'BCXKPVFA' # $400 gift card
    }
    assert_equal assigns(:order).final_cost, 0
    assert_not_nil assigns(:order).order_id
    assert_equal assigns(:order).order_id[0, 2], 'or'
  end

  test "A user with a referral credit should get a discount equal to their referral credit on their order. After their
        order is complete, their referral credit should be set to 0." do
    set_one_suit_cart_cookie
    user = users(:user_with_referral_credit)
    sign_in :user, user
    post :create, {
      order: @order_params,
      card_radio: 'use_saved_card'
    }
    assert_equal user.referral_credit, assigns(:order).referral_discount
    user.reload
    assert_equal user.referral_credit, 0
  end

  test "When a referred user makes their first purchase, the referrer should be credited $20 and the referral status
        should be updated" do
    set_one_suit_cart_cookie
    user = users(:user_with_referral_credit)
    sign_in :user, user
    post :create, {
      order: @order_params,
      card_radio: 'use_saved_card'
    }
    referral = user.referred_by
    assert_equal referral.referrer.referral_credit, 20
    assert_equal referral.status, Referral::STATUS_COMPLETED
  end

  test "an admin should be able to get admin route" do
    sign_in :user, users(:admin)
    get :admin
    assert_response :success
    assert_template :admin
  end

  test "a regular user should not be able to get admin route" do
    get :admin
    assert_response :redirect
  end
end
