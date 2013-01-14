require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "copy_line_items_from_cart" do
    cart = Cart.new
    add_item_to_cart cart
    assert !cart.empty?

    order = Order.new
    order.copy_line_items_from_cart cart
    assert_equal cart.line_items.length, 0
    assert_equal order.line_items.length, 1
  end
end
