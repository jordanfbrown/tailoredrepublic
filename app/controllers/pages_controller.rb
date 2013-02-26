class PagesController < ApplicationController
  def measuring_tape
    @address = new_address_or_from_user
  end

  def schedule_tailoring
    @scheduling_info = SchedulingInfo.new('', '', '')
  end

  def create_schedule_tailoring
    info = params[:scheduling_info]
    @scheduling_info = SchedulingInfo.new(info[:name], info[:email], info[:zip_code])
    if @scheduling_info.valid?
      ScheduleTailoringMailer.schedule_tailoring_email(info[:name], info[:email], info[:zip_code]).deliver
      redirect_to '/shop/suits', notice: 'We have received your request to schedule a tailoring. A Tailored Republic representative will contact you with details in the next 24 hours.'
    else
      render :schedule_tailoring
    end
  end

  def new_tape_address
    @address = Address.new(params[:address])
    if @address.valid?
      TapeMeasureMailer.tape_measure_email(@address).deliver
      redirect_to :measuring_tape, notice: 'Your tape measure request has been received. You can expect a tape measure in the mail in a couple of days.'
    else
      render :measuring_tape
    end
  end

  def coming_soon
    render layout: false
  end

  def request_access_code
    PotentialUser.create(email: params[:email])
    redirect_to root_path, notice: :new_user
  end

  def authenticate_access_code
    if params[:access_code] == ENV['ACCESS_CODE']
      cookies[:access_code] = params[:access_code]
      redirect_to root_path
    else
      redirect_to root_path, notice: :error
    end
  end

  def top_picks
    @top_picks = Product.top_picks
  end

  private
    def new_address_or_from_user
      user_signed_in? && !current_user.shipping_address.blank? ? current_user.shipping_address : Address.new
    end
end