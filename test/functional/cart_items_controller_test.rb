require 'test_helper'

class CartItemsControllerTest < ActionController::TestCase
  setup do
    set_basic_auth_credentials
  end

  test "should be able to post to create new cart items" do
    assert_difference('CartItem.count') do
      product = products(:charcoal)
      customization = customizations(:one)
      post :create, { product_id: product.id, customization_id: customization.id }
    end
  end
end