require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "copy_line_items_from_cart" do
    cart = carts(:empty)
    assert cart.empty?
    cart.line_items << line_items(:one)
    assert !cart.empty?
    order = orders(:empty_order)
    order.copy_line_items_from_cart cart
    cart.reload
    assert_equal cart.line_items.length, 0
    assert_equal order.line_items.length, 1
  end

  test "gift_cards" do
    order = orders(:gift_card_order)
    assert_equal order.gift_cards.length, 1
    assert order.has_gift_cards?
  end

  test "apply_coupon where order is $100 and coupon is $100" do
    coupon = coupons(:hundred_gift_card)
    order = orders(:gift_card_order) # $100 order
    order.apply_coupon(coupon)
    assert_equal order.coupon, coupon
    assert_equal order.discount, 100
  end

  test "apply_coupon where order is $100 and coupon is $400, discount should be $100" do
    coupon = coupons(:four_hundred_gift_card)
    order = orders(:gift_card_order) # $100 order
    order.apply_coupon(coupon)
    assert_equal order.coupon, coupon
    assert_equal order.discount, 100
  end
end
