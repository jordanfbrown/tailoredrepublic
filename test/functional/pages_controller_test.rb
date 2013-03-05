require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  [:about, :faq, :lookbook, :partners, :privacy_policy, :process, :team, :terms_of_service, :weddings].each do |page|
    test "#{page.to_s} page should render correctly" do
      get page
      assert_response :success
      assert_template page
    end
  end

  test "top picks should render correctly and return 4 top picks" do
    get :top_picks
    assert_response :success
    assert_template :top_picks
    assert_not_nil assigns(:top_picks)
    assert_equal assigns(:top_picks).count, 4
  end
end
