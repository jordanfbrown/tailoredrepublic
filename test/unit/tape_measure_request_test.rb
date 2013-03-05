require 'test_helper'

class TapeMeasureRequestTest < ActiveSupport::TestCase
  def setup
    @params = {
      email: 'jordan@tailoredrepublic.com',
      ip_address: '127.0.0.1',
      shipping_address_attributes: {
        name: 'Jordan Brown', line1: '11 Downey St.', city: 'San Francisco', state: 'CA', zip: 94041
      }
    }
  end

  test 'before creation, sent should be set to false' do
    tape_measure_request = TapeMeasureRequest.create(@params)
    assert !tape_measure_request.sent
  end
end
