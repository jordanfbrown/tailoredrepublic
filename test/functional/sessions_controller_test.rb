require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  test 'redirect_to should be saved in the session after a get to :new' do
    referer_url = 'https://www.tailoredrepublic.com/shop/suits'
    @request.env['HTTP_REFERER'] = referer_url
    get :new
    assert_equal session[:redirect_to], referer_url
  end

  test 'redirect_to should not be saved in the session after a get to :new if the referrer had "login" in it' do
    referer_url = 'https://www.tailoredrepublic.com/login'
    @request.env['HTTP_REFERER'] = referer_url
    get :new
    assert_not_equal session[:redirect_to], referer_url
  end

  test 'redirect_to should not be saved in the session after a get to :new if the referrer had "logout" in it' do
    referer_url = 'https://www.tailoredrepublic.com/logout'
    @request.env['HTTP_REFERER'] = referer_url
    get :new
    assert_not_equal session[:redirect_to], referer_url
  end

  test 'redirect_to should not be saved in the session after a get to :new if the referrer had "account" in it' do
    referer_url = 'https://www.tailoredrepublic.com/account'
    @request.env['HTTP_REFERER'] = referer_url
    get :new
    assert_not_equal session[:redirect_to], referer_url
  end
end
