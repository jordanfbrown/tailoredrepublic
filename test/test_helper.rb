ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "mocha/setup"

class ActiveSupport::TestCase
  fixtures :all

  def set_cart_cookie(cart_fixture)
    @request.cookie_jar.signed[:cart_id] = ActiveRecord::Fixtures.identify(cart_fixture)
    carts(cart_fixture)
  end

  def json_response
    ActiveSupport::JSON.decode @response.body
  end
end

class ActionController::TestCase
  include Devise::TestHelpers
end
