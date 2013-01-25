require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "depluralize_category" do
    assert_equal Product.depluralize_category('suits'), :suit
    assert_equal Product.depluralize_category('shirts'), :shirt
    assert_equal Product.depluralize_category('pants'), :pants
    assert_equal Product.depluralize_category('accessories'), :accessory
    assert_equal Product.depluralize_category('foo'), :suit
  end

  test "can't delete a product if its referenced by a line item" do
    product = products(:executive)
    LineItem.new(product: product)
    product.destroy
    assert product.errors.any?
  end

  test "can delete a product if its not referenced by a line item" do
    product = Product.new
    product.destroy
    assert !product.errors.any?
  end
end
