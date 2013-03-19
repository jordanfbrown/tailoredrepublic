class CustomizationsController < ApplicationController
  def create
    customization = Customization.new(params[:customization])
    if customization.save
      render json: customization
    else
      render json: customizations.errors, status: :unprocessable_entity
    end
  end

  def update
    customization = Customization.find(params[:id])
    if customization.update_attributes(params[:customization])
      render json: customization
    else
      render json: customization.errors, status: :unprocessable_entity
    end
  end

  def show
    customization = Customization.find(params[:id])
    render json: customization
  end
end