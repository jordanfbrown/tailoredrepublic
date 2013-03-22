class MeasurementsController < ApplicationController
  def show
    if user_signed_in?
      @measurement = current_user.measurement || current_user.build_measurement
    else
      if cookies.signed[:measurement_id]
        @measurement = get_measurement_from_cookie || Measurement.new
      else
        @measurement = Measurement.new
      end
    end

    @only_shirts = @cart.only_shirts?
    @measurement_metadata = Measurement.metadata(@only_shirts)
    @num_measurements = Measurement.num_measurements(@only_shirts)
    @signed_in = user_signed_in?
    @initial_slide = params[:initial_slide]
  end

  def create
    measurement = Measurement.new(params[:measurement])
    measurement.user = current_user if user_signed_in?

    if measurement.save
      cookies.permanent.signed[:measurement_id] = measurement.id
      render json: measurement
    else
      render json: measurement.errors, status: :unprocessable_entity
    end

  end

  def update
    if user_signed_in?
      measurement = current_user.measurement
    elsif cookies.signed[:measurement_id]
      measurement = get_measurement_from_cookie
      render json: 'Unable to find measurement', status: 500 and return if measurement.nil?
    else
      render json: 'Unable to find measurement', status: 500 and return
    end

    if measurement.update_attributes(params[:measurement])
      render json: measurement
    else
      render json: measurement.errors, status: :unprocessable_entity
    end
  end
end
