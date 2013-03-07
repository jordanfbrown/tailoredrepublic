require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "total_price should be equal to sum of line item prices" do
    cart = carts(:one_shirt_one_suit)
    assert_equal cart.total_price, 633
  end

  test "total_price should be 0 for an empty cart" do
    cart = carts(:empty)
    assert_equal cart.total_price, 0
  end

  test "shirt_only? should be false if there is a suit in the cart and no shirts" do
    cart = carts(:one_suit)
    assert !cart.shirt_only?
  end

  test "shirt_only? should be false if there is at least 1 shirt and at least 1 suit in the cart" do
    cart = carts(:one_shirt_one_suit)
    assert !cart.shirt_only?
  end

  test "shirt_only? should be true if there is at least 1 shirt and no suit in the cart" do
    cart = carts(:one_shirt)
    assert cart.shirt_only?
  end

  test "skip_measurements? should be false if there is a suit in the cart" do
    cart = carts(:one_suit)
    assert !cart.skip_measurements?
  end

  test "skip_measurements? should be false if there is a shirt in the cart" do
    cart = carts(:one_shirt)
    assert !cart.skip_measurements?
  end

  test "skip_measurements? should be true if there is a no shirt or suit in the cart" do
    cart = carts(:one_shirt)
    assert !cart.skip_measurements?
  end
end
