ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def set_basic_auth_credentials
    @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials('tailored', 'sodamnclean!')
  end

  def set_full_cart_cookie
    @request.cookie_jar.signed[:cart_id] = 1
  end

  def set_empty_cart_cookie
    @request.cookie_jar.signed[:cart_id] = 2
  end

end

class ActionController::TestCase
  include Devise::TestHelpers
end
