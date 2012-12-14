class CustomizationsController < ApplicationController
  def create
    customization = Customization.create params[:customization]
    render :json => customization
  end

  def update
    customization = Customization.find params[:id]
    if customization.update_attributes params[:customization]
      render :json => customization
    else
      render json: customization.errors, status: :unprocessable_entity
    end
  end
end