require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  setup do
    @product = products(:executive)
    @customization = customizations(:suit)
  end

  test "should be able to create a line item with customizations" do
    line_item_count = LineItem.count
    post :create, { product_id: @product.id, customization_id: @customization.id }
    assert_equal LineItem.count, line_item_count + 1
    json = json_response
    assert_equal 1, json['quantity']
    assert_equal @product.id, json['product_id']
    assert_equal @customization.id, json['customization_id']
  end

  test "should be able to create a line item without customizations" do
    line_item_count = LineItem.count
    post :create, { product_id: @product.id }
    assert_equal LineItem.count, line_item_count + 1
    json = json_response
    assert_equal 1, json['quantity']
    assert_equal @product.id, json['product_id']
  end

  test 'should be able to update a line item\'s quantity' do
    cart = set_full_cart_cookie
    line_item = cart.line_items.first
    old_quantity = line_item.quantity
    put :update, id: line_item.id, line_item: { quantity: 2 }
    line_item.reload
    assert_not_equal line_item.quantity, old_quantity
    assert_equal line_item.quantity, 2
  end

  test 'should be able to delete a line item' do
    cart = set_full_cart_cookie
    line_item = cart.line_items.first
    delete :destroy, id: line_item.id
    assert_equal json_response['success'], true
    assert_raise(ActiveRecord::RecordNotFound) { line_item.reload }
  end

  test 'shouldnt be able to delete a line item outside of your cart' do
    cart = carts(:one_suit)
    line_item = cart.line_items.first
    delete :destroy, id: line_item.id
    assert_response :not_found
    assert_equal json_response['error'], 'Not found'
  end
end