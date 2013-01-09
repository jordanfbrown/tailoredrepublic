class MeasurementsController < ApplicationController
  def index
    if user_signed_in?
      @measurement = current_user.measurement || current_user.build_measurement
    else
     @measurement = Measurement.new
    end
  end

  def create
    measurement = Measurement.new params[:measurement]

    if user_signed_in?
      measurement.user = current_user
    end

    if measurement.save
      render json: measurement
    else
      render json: measurement.errors, status: :unprocessable_entity
    end

    end

  def update
    measurement = Measurement.find params[:id]

    if measurement.update_attributes params[:measurement]
      render json: measurement
    else
      render json: measurement.errors, status: :unprocessable_entity
    end
  end
end
