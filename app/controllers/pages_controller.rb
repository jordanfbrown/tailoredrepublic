class PagesController < ApplicationController
  def measuring_tape
    @address = new_address_or_from_user
  end

  def schedule_tailoring
    @scheduling_info = SchedulingInfo.new('', '', '', '', '')
  end

  def create_schedule_tailoring
    info = params[:scheduling_info]
    @scheduling_info = SchedulingInfo.new(info[:name], info[:email], info[:zip_code], info[:phone_number],
                                          info[:subscribe_to_mailing_list])

    if @scheduling_info.valid?
      if info[:subscribe_to_mailing_list] == "1"
        gibbon = Gibbon.new
        gibbon.list_subscribe(id: GIBBON_LIST_ID, email_address: info[:email])
      end
      ScheduleTailoringMailer.schedule_tailoring_email(info[:name], info[:email], info[:zip_code], info[:phone_number]).deliver
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

  def top_picks
    @top_picks = Product.top_picks
  end

  private
    def new_address_or_from_user
      user_signed_in? && !current_user.shipping_address.blank? ? current_user.shipping_address : Address.new
    end
end