require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  test 'show should render correctly' do
    set_full_cart_cookie
    get :show
    assert_response :success
    assert_template :show
    assert_not_nil assigns(:line_items)
    assert_equal assigns(:line_items).count, 2
    assert_not_nil assigns(:skip_measurements)
  end
end
