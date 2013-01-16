require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "copy_line_items_from_cart" do
    cart = carts(:empty)
    assert cart.empty?
    cart.line_items << line_items(:one)
    assert !cart.empty?
    order = orders(:first_order)
    order.copy_line_items_from_cart cart
    # TODO: fix this
    #assert_equal cart.line_items.length, 0
    assert_equal order.line_items.length, 1
  end
end
