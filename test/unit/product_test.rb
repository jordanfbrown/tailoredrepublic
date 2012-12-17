require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "display price formatted properly" do
    product = Product.new(price: 329.99)
    assert product.display_price == 329
  end
end
