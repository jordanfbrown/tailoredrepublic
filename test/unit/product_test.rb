require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "depluralize_category" do
    assert_equal Product.depluralize_category('suits'), :suit
    assert_equal Product.depluralize_category('shirts'), :shirt
    assert_equal Product.depluralize_category('pants'), :pants
    assert_equal Product.depluralize_category('accessories'), :accessory
    assert_equal Product.depluralize_category('foo'), :error
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

  test "suggested products for a suit should return 2 accessories and 2 shirts" do
    product = products(:executive)
    suggested_products = Product.suggested(product.id)
    assert_equal suggested_products.length, 4
    accessory_count = suggested_products.select { |p| p.category == :accessory }.length
    assert_equal accessory_count, 2
    shirt_count = suggested_products.select { |p| p.category == :shirt }.length
    assert_equal shirt_count, 2
  end

  test "suggested products for a shirt should return 2 accessories and 2 suits" do
    product = products(:blue_shirt)
    suggested_products = Product.suggested(product.id)
    assert_equal suggested_products.length, 4
    accessory_count = suggested_products.select { |p| p.category == :accessory }.length
    assert_equal accessory_count, 2
    suit_count = suggested_products.select { |p| p.category == :suit }.length
    assert_equal suit_count, 2
  end

  test "suggested products for an accessory should return 2 suits and 2 shirts" do
    product = products(:coral_pocket_square)
    suggested_products = Product.suggested(product.id)
    assert_equal suggested_products.length, 4
    shirt_count = suggested_products.select { |p| p.category == :shirt }.length
    assert_equal shirt_count, 2
    suit_count = suggested_products.select { |p| p.category == :suit }.length
    assert_equal suit_count, 2
  end

  test "average_rating should return the rounded average of all accepted reviews for a product" do
    product = products(:executive)
    assert_equal 4, product.average_rating
  end

  test "average_rating should return 0 if a product has no reviews" do
    product = products(:hustler)
    assert_equal 0, product.average_rating
  end
end
