require 'test_helper'

class CouponTest < ActiveSupport::TestCase
  test "generate_code should return an eight character string only containing capital letters" do
    code = Coupon.generate_code
    assert_match /^[A-Z]{8}$/, code
  end

  test "create_coupons_from_order with quantity 1" do
    order = orders(:gift_card_order)
    coupon_count = Coupon.count
    Coupon.create_coupons_from_order(order)

    assert_equal Coupon.count, coupon_count + 1
    assert_equal order.generated_coupons.length, 1

    generated_coupon = order.generated_coupons.last
    assert_equal generated_coupon.amount, 100
    assert_equal generated_coupon.description, '$100 Gift Card'
    assert_equal generated_coupon.quantity, 1
    assert_equal generated_coupon.coupon_type, 'gift_card'
    assert_equal generated_coupon.discount_type, 'fixed'
    assert_not_nil generated_coupon.code
  end

  test "create_coupons_from_order with quantity greater than 1" do
    order = orders(:gift_card_order)
    coupon_count = Coupon.count

    gift_cards = order.line_items.first
    gift_cards.update_attributes!(quantity: 4)
    Coupon.create_coupons_from_order(order)

    assert_equal order.generated_coupons.length, 4
    assert_equal Coupon.count, coupon_count + 4
  end

  test "invalid? should be true if quantity is 0" do
    coupon = coupons(:zero_quantity)
    assert coupon.invalid?
  end

  test "invalid? should be true if today's date is after the end date" do
    coupon = coupons(:expired_end_date)
    assert coupon.invalid?
  end

  test "invalid? should be true if today's date is before the start date" do
    coupon = coupons(:hasnt_started)
    assert coupon.invalid?
  end

  test "discount_for_category when apply_to_type='category', apply_to_group='suit', and discount_type='percentage' should work correctly" do
    coupon = coupons(:suit_category_coupon) # 50% off promotion
    line_items = [ line_items(:one), line_items(:two) ]
    discount = coupon.discount_for_category(line_items)
    assert_equal discount, (line_items[0].unit_price + line_items[1].unit_price) * 0.5
  end

  test "discount_for_category when apply_to_type='category', apply_to_group='suit', and discount_type='fixed' should work correctly" do
    coupon = coupons(:suit_category_coupon) # 50% off promotion
    coupon.discount_type = 'fixed' # now $50
    line_items = [ line_items(:one), line_items(:two) ]
    discount = coupon.discount_for_category(line_items)
    assert_equal discount, 100
  end

  test "discount_for_category when apply_to_type='category', apply_to_group='suit', and discount_type='fixed' should work correctly when quantity > 1" do
    coupon = coupons(:suit_category_coupon) # 50% off promotion
    coupon.discount_type = 'fixed' # now $50
    line_item = line_items(:one)
    line_item.quantity = 3
    line_item = [ line_item ]
    discount = coupon.discount_for_category(line_item)
    assert_equal discount, 150
  end

  test "discount_for_category when apply_to_type='subcategory', apply_to_group='pocket_square', discount_type='percentage' should work correctly" do
    coupon = coupons(:pocket_square_subcategory_coupon) # 50% off promotion
    line_items = [ line_items(:pocket_square) ]
    discount = coupon.discount_for_category(line_items)
    assert_equal discount, (line_items[0].unit_price) * 0.5
  end

  test "discount_for_category when apply_to_type='subcategory', apply_to_group='pocket_square', discount_type='fixed' should work correctly" do
    coupon = coupons(:pocket_square_subcategory_coupon)
    # set up a $5 fixed coupon
    coupon.amount = 5
    coupon.discount_type = 'fixed'
    line_items = [ line_items(:pocket_square) ]
    discount = coupon.discount_for_category(line_items)
    assert_equal discount, 5
  end

  test "discount_for_category when apply_to_type='product', apply_to_product='blue_shirt', discount_type='percentage' should work correctly" do
    coupon = coupons(:blue_shirt_product_coupon) # 50% off promotion
    line_items = [ line_items(:blue_shirt), line_items(:pocket_square) ]
    discount = coupon.discount_for_category(line_items)
    assert_equal discount, (line_items[0].unit_price) * 0.5
  end

  test "discount_for_category when apply_to_type='product', apply_to_product='blue_shirt', discount_type='fixed' should work correctly" do
    coupon = coupons(:blue_shirt_product_coupon)
    # set up a $5 fixed coupon
    coupon.amount = 5
    coupon.discount_type = 'fixed'
    line_items = [ line_items(:blue_shirt), line_items(:pocket_square) ]
    discount = coupon.discount_for_category(line_items)
    assert_equal discount, 5
  end

  test "discount_for_order should return the total discount for every line item correctly for a percentage discount" do
    coupon = coupons(:ten_percent_off)
    line_items = [ line_items(:blue_shirt), line_items(:pocket_square), line_items(:one) ]
    discount = coupon.discount_for_order(line_items)
    assert_equal discount, ((line_items[0].unit_price + line_items[1].unit_price + line_items[2].unit_price) * 0.10).round(2)
  end

  test "discount_for_order should return the total discount for every line item correctly for a fixed discount" do
    coupon = coupons(:ten_percent_off)
    coupon.discount_type = 'fixed'
    line_items = [ line_items(:blue_shirt), line_items(:pocket_square), line_items(:one) ]
    discount = coupon.discount_for_order(line_items)
    assert_equal discount, 10
  end

  test "discount_for_customization should work for vest with a percentage discount" do
    coupon = coupons(:vest_customization_coupon)
    line_items = [ line_items(:suit_with_vest) ]
    discount = coupon.discount_for_customization(line_items)
    assert_equal discount, Product.vest_price * 0.5
  end

  test "discount_for_customization should work for vest with a percentage discount when quantity > 1" do
    coupon = coupons(:vest_customization_coupon)
    line_item = line_items(:suit_with_vest)
    line_item.quantity = 3
    line_items = [ line_item ]
    discount = coupon.discount_for_customization(line_items)
    assert_equal discount, (Product.vest_price * 0.5) * 3
  end

  test "update_amount! should reduce quantity by 1 if full value has been used for a fixed coupon and subtract discount" do
    coupon = coupons(:hundred_gift_card)
    order = orders(:gift_card_order)
    order.discount = 100
    coupon.update_amount!(order)
    assert_equal coupon.quantity, 0
    assert_equal coupon.amount, 0
  end

  test "update_amount! should not reduce quantity by 1 if full value of fixed coupon hasnt been used" do
    coupon = coupons(:hundred_gift_card)
    assert_equal coupon.quantity, 1
    order = orders(:gift_card_order)
    order.discount = 50
    coupon.update_amount!(order)
    assert_equal coupon.quantity, 1
    assert_equal coupon.amount, 50
  end

  test "update_amount! should not reduce amount of a promotional coupon but should reduce quantity by 1" do
    coupon = coupons(:ten_percent_off)
    coupon_amount_before = coupon.amount
    coupon_quantity_before = coupon.quantity
    order = orders(:gift_card_order)
    order.discount = 50
    coupon.update_amount!(order)
    assert_equal coupon.quantity, coupon_quantity_before - 1
    assert_equal coupon.amount, coupon_amount_before
  end
end
