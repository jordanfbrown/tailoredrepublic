ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "mocha/setup"

class ActiveSupport::TestCase
  fixtures :all

  def set_full_cart_cookie
    @request.cookie_jar.signed[:cart_id] = ActiveRecord::Fixtures.identify(:two_suits)
    carts(:two_suits)
  end

  def set_empty_cart_cookie
    @request.cookie_jar.signed[:cart_id] = ActiveRecord::Fixtures.identify(:empty)
  end

  def set_one_suit_cart_cookie
    @request.cookie_jar.signed[:cart_id] = ActiveRecord::Fixtures.identify(:one_suit)
  end

  def json_response
    ActiveSupport::JSON.decode @response.body
  end
end

class ActionController::TestCase
  include Devise::TestHelpers
end
