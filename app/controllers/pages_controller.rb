class PagesController < ApplicationController
  def measuring_tape
    @address = Address.new
  end

  def schedule_tailoring
    @address = Address.new
  end

  def create_schedule_tailoring
    @address = Address.new(params[:address])
    if @address.valid_with_phone?
      ScheduleTailoringMailer.schedule_tailoring_email(@address).deliver
      redirect_to :schedule_tailoring, notice: 'We have received your request to schedule a tailoring. A Tailored Republic representative will call you with details in the next 24 hours.'
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
end