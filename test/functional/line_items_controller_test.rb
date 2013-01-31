require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  test "should be able to post to create new line items" do
    assert_difference('LineItem.count') do
      product = products(:executive)
      customization = customizations(:suit)
      post :create, { product_id: product.id, customization_id: customization.id }
    end
  end
end