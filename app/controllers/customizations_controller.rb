class CustomizationsController < ApplicationController
  def create
    customization = Customization.create params[:customization]
    render :json => customization
  end

end