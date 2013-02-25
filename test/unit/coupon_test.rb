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

  test "calculate_discount for a fixed amount coupon should return the coupon amount if the order costs more than the coupon" do
    coupon = coupons(:hundred_gift_card)
    assert_equal coupon.calculate_discount(500), 100
    assert_equal coupon.calculate_discount(1000), 100
  end

  test "calculate_discount for a fixed amount coupon should return the order amount if the coupon is worth more than the order" do
    coupon = coupons(:hundred_gift_card)
    assert_equal coupon.calculate_discount(50), 50
    assert_equal coupon.calculate_discount(25), 25
  end

  test "calculate_discount for a percentage coupon should return a percentage of the total price" do
    coupon = coupons(:ten_percent_off)
    assert_equal coupon.calculate_discount(500), 50
    assert_equal coupon.calculate_discount(1000), 100
  end

  test "create_coupons_from_order with quantity 1" do
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

  test "create_coupons_from_order with quantity greater than 1" do
    order = orders(:gift_card_order)
    coupon_count = Coupon.count

    gift_cards = order.line_items.first
    gift_cards.update_attributes!(quantity: 4)
    Coupon.create_coupons_from_order(order)

    assert_equal order.generated_coupons.length, 4
    assert_equal Coupon.count, coupon_count + 4
  end

  test "update_amount! should reduce quantity by 1 if full value has been used for a fixed coupon and subtract discount" do
    coupon = coupons(:hundred_gift_card)
    order = orders(:gift_card_order)
    order.discount = 100
    coupon.update_amount!(order)
    assert_equal coupon.quantity, 0
    assert_equal coupon.amount, 0
  end

  test "update_amount! should not reduce quantity by 1 if full value of fixed coupon hasnt been used" do
    coupon = coupons(:hundred_gift_card)
    order = orders(:gift_card_order)
    order.discount = 50
    coupon.update_amount!(order)
    assert_equal coupon.quantity, 1
    assert_equal coupon.amount, 50
  end

  test "update_amount! should not reduce amount of a promotional coupon but should reduce quantity by 1" do
    coupon = coupons(:ten_percent_off)
    coupon_amount_before = coupon.amount
    coupon_quantity_before = coupon.quantity
    order = orders(:gift_card_order)
    order.discount = 50
    coupon.update_amount!(order)
    assert_equal coupon.quantity, coupon_quantity_before - 1
    assert_equal coupon.amount, coupon_amount_before
  end

  test "generate_code should return an eight character string only containing capital letters" do
    code = Coupon.generate_code
    assert_match /^[A-Z]{8}$/, code
  end
end
