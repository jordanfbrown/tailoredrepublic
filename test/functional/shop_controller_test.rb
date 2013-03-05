require 'test_helper'

class ShopControllerTest < ActionController::TestCase
  test 'getting index with no params should redirect to /shop/suits' do
    get :index
    assert_equal assigns(:category), :error
    assert_response :redirect
    assert_redirected_to '/shop/suits'
  end

  test 'getting index with bad category should redirect to /shop/suits' do
    get :index, { category: 'foo' }
    assert_equal assigns(:category), :error
    assert_response :redirect
    assert_redirected_to '/shop/suits'
  end

  test 'getting index with suits category should be successful' do
    get :index, { category: 'suits' }
    assert_response :success
    assert_template :index
    assert_equal assigns(:category), :suit
    assert_equal assigns(:display_category), 'Suits'
    assert_not_nil assigns(:products)
  end

  test "gift cards should render successfully" do
    get :gift_cards
    assert_response :success
    assert_template :gift_cards
    assert_not_nil assigns(:gift_cards)
  end
end
