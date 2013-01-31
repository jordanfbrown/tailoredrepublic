ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

  def set_full_cart_cookie
    @request.cookie_jar.signed[:cart_id] = ActiveRecord::Fixtures.identify(:two_suits)
  end

  def set_empty_cart_cookie
    @request.cookie_jar.signed[:cart_id] = ActiveRecord::Fixtures.identify(:empty)
  end

end

class ActionController::TestCase
  include Devise::TestHelpers
end
