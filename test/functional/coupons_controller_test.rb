require 'test_helper'

class CouponsControllerTest < ActionController::TestCase
  setup do
    sign_in :user, users(:admin)
    @coupon_params = {
      code: 'ABCDEFGH',
      description: 'Test',
      quantity: 1,
      amount: 200,
      coupon_type: 'promotion',
      discount_type: 'fixed'
    }
  end

  test 'should be able to get index' do
    get :index
    assert_response :success
    assert_template :index
  end

  test 'should be able to get new' do
    get :new
    assert_response :success
    assert_template :new
  end

  test 'should be able to edit' do
    coupon = coupons(:hundred_gift_card)
    get :edit, id: coupon.id
    assert_response :success
    assert_template :edit
    assert_equal assigns(:coupon), coupon
  end

  test 'should be able to create a coupon' do
    count = Coupon.count
    post :create, coupon: @coupon_params
    assert_equal Coupon.count, count + 1
    assert_response :redirect
  end

  test 'should be able to update a coupon' do
    coupon = coupons(:hundred_gift_card)
    put :update, id: coupon.id, coupon: @coupon_params
    assert_response :redirect
    coupon.reload
    assert_equal coupon.code, @coupon_params[:code]
  end

  test 'should be able to delete a coupon' do
    coupon = coupons(:hundred_gift_card)
    delete :destroy, id: coupon.id
    assert_response :redirect
    assert_raise(ActiveRecord::RecordNotFound) { coupon.reload }
  end

end
