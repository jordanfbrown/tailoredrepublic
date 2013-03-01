class TapeMeasureRequestsController < ApplicationController
  load_and_authorize_resource except: [:new, :create]

  def index
    params[:filter] ||= 'all'
    params[:page] ||= 1
    @filter = params[:filter]
    @tape_measure_requests = TapeMeasureRequest.filter_by_status(@filter, params[:page])
  end

  def new
    @tape_measure_request = TapeMeasureRequest.new
    if user_signed_in?
       @tape_measure_request.shipping_address = current_user.shipping_address.dup unless current_user.shipping_address.blank?
       @tape_measure_request.email = current_user.email unless current_user.email.blank?
    else
      @tape_measure_request.build_shipping_address
    end

  end

  def create
    @tape_measure_request = TapeMeasureRequest.new(params[:tape_measure_request])
    @tape_measure_request.ip_address = request.remote_ip

    if @tape_measure_request.save
      if params[:subscribe_to_mailing_list] == "1"
        gibbon = Gibbon.new
        begin
          gibbon.list_subscribe(id: GIBBON_LIST_ID, email_address: params[:tape_measure_request][:email])
        rescue
          puts 'Ignoring error'
        end
      end
      redirect_to '/shop/suits', notice: 'Your tape measure request has been received. You can expect a tape measure in the mail in a couple of days.'
    else
      render :new
    end
  end

  def update
    @tape_measure_request = TapeMeasureRequest.find(params[:id])

    if @tape_measure_request.update_attributes(params[:tape_measure_request])
      head :no_content
    else
      render json: @tape_measure_request.errors, status: :unprocessable_entity
    end
  end
end
