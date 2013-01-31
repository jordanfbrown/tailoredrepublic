class MeasurementsController < ApplicationController
  def show
    if user_signed_in?
      @measurement = current_user.measurement || current_user.build_measurement
    else
      if session[:measurement_id]
        @measurement = get_measurement_from_session || Measurement.new
      else
        @measurement = Measurement.new
      end
    end

    @shirt_only = @cart.shirt_only?
    @num_measurements = Product.num_measurements(@shirt_only)
    @signed_in = user_signed_in?
  end

  def create
    measurement = Measurement.new(params[:measurement])
    measurement.user = current_user if user_signed_in?

    if measurement.save
      session[:measurement_id] = measurement.id
      render json: measurement
    else
      render json: measurement.errors, status: :unprocessable_entity
    end

  end

  def update
    if user_signed_in?
      measurement = current_user.measurement
    elsif session[:measurement_id]
      measurement = get_measurement_from_session
      if measurement.nil?
        render json: 'Unable to find measurement', status: 500
      end
    end

    if measurement.update_attributes params[:measurement]
      render json: measurement
    else
      render json: measurement.errors, status: :unprocessable_entity
    end
  end
end
