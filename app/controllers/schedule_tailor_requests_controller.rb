class ScheduleTailorRequestsController < ApplicationController
  load_and_authorize_resource except: [:new, :create]

  def index
    params[:filter] ||= 'all'
    params[:page] ||= 1
    @filter = params[:filter]
    @schedule_tailor_requests = ScheduleTailorRequest.filter_by_status(@filter, params[:page])
  end

  def new
    @schedule_tailor_request = ScheduleTailorRequest.new
    if user_signed_in?
      @schedule_tailor_request.email = current_user.email unless current_user.email.blank?
      @schedule_tailor_request.name = current_user.name unless current_user.name.blank?
      @schedule_tailor_request.zip = current_user.shipping_address.zip unless current_user.shipping_address.blank?
    end
  end

  def create
    @schedule_tailor_request = ScheduleTailorRequest.new(params[:schedule_tailor_request])
    @schedule_tailor_request.ip_address = request.remote_ip

    if @schedule_tailor_request.save
      if params[:subscribe_to_mailing_list] == "1"
        begin
          Gibbon.list_subscribe(id: GIBBON_LIST_ID, email_address: params[:schedule_tailor_request][:email])
        rescue
          puts 'Ignoring error'
        end
      end
      redirect_to '/shop/suits', notice: 'We have received your request to schedule a tailoring. A Tailored Republic representative will contact you with details in the next 24 hours.'
    else
      render :new
    end
  end

  def update
    @schedule_tailor_request = ScheduleTailorRequest.find(params[:id])

    if @schedule_tailor_request.update_attributes(params[:schedule_tailor_request])
      head :no_content
    else
      render json: @schedule_tailor_request.errors, status: :unprocessable_entity
    end
  end
end
