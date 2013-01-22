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
end
