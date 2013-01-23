require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "total_price" do
    cart = carts(:empty)
    product = products(:executive)
    product.price = 500
    product.save
    LineItem.create(product: product, cart_id: cart.id, customization: customizations(:one))
    LineItem.create(product: product, cart_id: cart.id, customization: customizations(:two))
    assert_equal cart.total_price, 1000
  end

  test "shirt_only? should be false if there is a suit in the cart and no shirts" do
    cart = carts(:one)
    assert !cart.shirt_only?
  end

  test "shirt_only? should be false if there is at least 1 shirt and at least 1 suit in the cart" do
    cart = carts(:one)
    cart.line_items << LineItem.new(product: products(:white_shirt), customization: customizations(:one))
    assert !cart.shirt_only?
  end

  test "shirt_only? should be true if there is at least 1 shirt and no suit in the cart" do
    cart = carts(:empty)
    cart.line_items << LineItem.new(product: products(:white_shirt), customization: customizations(:one))
    assert cart.shirt_only?
  end
end
