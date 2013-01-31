require 'test_helper'

class MeasurementTest < ActiveSupport::TestCase
  test 'Measurements must be less than 90' do
    measurement = measurements(:one)
    measurement.neck = 100
    assert measurement.invalid?
  end

  test 'Measurements must be greater than 0' do
    measurement = measurements(:one)
    measurement.neck = -1
    assert measurement.invalid?
  end

  test 'Crotch, thigh, and pant length are not mandatory' do
    measurement = measurements(:one)
    measurement.crotch = nil
    measurement.thigh = nil
    measurement.pant_length = nil
    measurement.save
    assert measurement.valid?
  end
end