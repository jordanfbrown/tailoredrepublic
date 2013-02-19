require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  test "total_price should be the price of the product if there is no vest or pick stitching" do
    line_item = line_items(:one)
    assert_equal line_item.total_price, line_item.product.price
  end

  test "total_price should be doubled if quantity is 2" do
    line_item = line_items(:one)
    original_price = line_item.total_price
    line_item.quantity = 2
    assert_equal original_price * 2, line_item.total_price
  end

  test "total_price should be Product.vest_price more if there is a vest" do
    line_item = line_items(:one)
    line_item.customization.vest = true
    assert_equal line_item.total_price, line_item.product.price + Product.vest_price
  end

  test "total_price should be Product.vest_price + Product.pick_stitching_price more if there is a vest and pick stitching" do
    line_item = line_items(:one)
    line_item.customization.vest = true
    line_item.customization.pick_stitching = true
    assert_equal line_item.total_price, line_item.product.price + Product.vest_price + Product.pick_stitching_price
  end
end