require 'test_helper'

class CouponTest < ActiveSupport::TestCase
  test "invalid? should be true if quantity is 0" do
    coupon = coupons(:zero_quantity)
    assert coupon.invalid?
  end

  test "invalid? should be true if today's date is after the end date" do
    coupon = coupons(:expired_end_date)
    assert coupon.invalid?
  end

  test "invalid? should be true if today's date is before the start date" do
    coupon = coupons(:hasnt_started)
    assert coupon.invalid?
  end

  test "calculate_discount for a fixed amount coupon should always return the amount, regardless of total price" do
    coupon = coupons(:hundred_gift_card)
    assert_equal coupon.calculate_discount(500), 100
    assert_equal coupon.calculate_discount(1000), 100
  end

  test "calculate_discount for a percentage coupon should return a percentage of the total price" do
    coupon = coupons(:ten_percent_off)
    assert_equal coupon.calculate_discount(500), 50
    assert_equal coupon.calculate_discount(1000), 100
  end

  test "apply_to_order" do
    coupon = coupons(:hundred_gift_card)
    order = orders(:gift_card_order) # $100 order
    coupon_quantity_before = coupon.quantity
    coupon.apply_to_order(order)

    assert_equal order.discount, 100
    assert_equal order.final_cost, 0
    assert_equal coupon.quantity, coupon_quantity_before - 1
    assert_equal coupon.amount, 0
  end
end
