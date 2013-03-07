require 'test_helper'

class CustomizationTest < ActiveSupport::TestCase
  test "fabric_id should return the correct fabric ID" do
    assert_equal Customization.fabric_id('charcoal-pinstripe'), '10005.202/1'
    assert_equal Customization.fabric_id('granite-red'), '10005.170/1'
    assert_equal Customization.fabric_id('powder-blue-pinstripe'), '10005.005/2'
    assert_equal Customization.fabric_id('stone-gray-with-blue'), '10005.170/2'
    assert_equal Customization.fabric_id('asdfasdfasdf'), 'Unknown fabric'
  end

  test "has_vest? should be false if vest == 0" do
    customization = customizations(:suit)
    customization.vest = 0
    assert !customization.has_vest?
  end

  test "has_vest? should be false if vest > 0" do
    customization = customizations(:suit)
    customization.vest = 3
    assert customization.has_vest?
  end
end