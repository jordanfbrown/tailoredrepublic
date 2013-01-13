require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "copy_line_items_from_cart" do
    cart = Cart.new
    product = products(:charcoal)
    customization = customizations(:one)
    cart.line_items.build(product: product, customization: customization)
    assert !cart.empty?

    order = Order.new
    order.copy_line_items_from_cart cart
    assert_equal cart.line_items.length, 0
    assert_equal order.line_items.length, 1
  end
end
