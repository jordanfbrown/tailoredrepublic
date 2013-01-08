class MeasurementsController < ApplicationController
  def show
    if user_signed_in?
      @measurements = current_user.measurements || current_user.build_measurements
    else
     @measurements = Measurements.new
    end
  end
end
