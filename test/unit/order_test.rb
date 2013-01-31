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

  test "calculate_discount with no coupon should be 0" do
    order = orders(:gift_card_order)
    assert_equal order.calculate_discount, 0
    assert_equal order.total_cost, 100
  end

  test "calculate_discount with a 10% off coupon, $100 order, should be $10" do
    order = orders(:gift_card_order)
    order.coupon = coupons(:ten_percent_off)
    assert_equal order.cost_before_discount, 100
    assert_equal order.calculate_discount, 10
    assert_equal order.total_cost, 90
  end
end
