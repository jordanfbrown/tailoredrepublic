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

  test "apply_to_order where total comes out to 0" do
    coupon = coupons(:hundred_gift_card)
    order = orders(:gift_card_order) # $100 order
    coupon_quantity_before = coupon.quantity
    coupon.apply_to_order(order)

    assert_equal order.discount, 100
    assert_equal order.final_cost, 0
    assert_equal coupon.quantity, coupon_quantity_before - 1
    assert_equal coupon.amount, 0
  end

  test "apply_to_order where gift card amount is more than order ($400 gift card, $100 order)" do
    coupon = coupons(:four_hundred_gift_card)
    order = orders(:shirt_order)
    coupon.apply_to_order(order)

    assert_equal order.discount, 100
    assert_equal order.final_cost, 0
    assert_equal coupon.quantity, 1  # Coupon still exists
    assert_equal coupon.amount, 300 # Amount of order has been subtracted
  end

  test "create_coupons_from_order" do
    order = orders(:gift_card_order)
    coupon_count = Coupon.count
    Coupon.create_coupons_from_order(order)

    assert_equal Coupon.count, coupon_count + 1
    assert_equal order.generated_coupons.length, 1

    generated_coupon = order.generated_coupons.last
    assert_equal generated_coupon.amount, 100
    assert_equal generated_coupon.description, '$100 Gift Card'
    assert_equal generated_coupon.quantity, 1
    assert_equal generated_coupon.coupon_type, 'gift_card'
    assert_equal generated_coupon.discount_type, 'fixed'
    assert_not_nil generated_coupon.code
  end
end
