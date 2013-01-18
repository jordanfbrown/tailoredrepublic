class MailingListController < ApplicationController
  def subscribe
    unless params[:email].blank?
      gibbon = Gibbon.new
      if gibbon.list_subscribe(id: GIBBON_LIST_ID, email_address: params[:email])
        render json: { success: true }, status: 200
      else
        render json: { success: false }, status: 500
      end
    else
      render json: { success: false }, status: 500
    end
  end
end