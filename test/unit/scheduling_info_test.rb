require 'test_helper'

class SchedulingInfoTest < ActiveSupport::TestCase
  test 'validations should work' do
    info = SchedulingInfo.new('', '', '')
    assert !info.valid?
  end
end