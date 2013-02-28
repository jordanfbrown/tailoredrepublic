class PagesController < ApplicationController
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
        begin
          gibbon.list_subscribe(id: GIBBON_LIST_ID, email_address: info[:email])
        rescue
          puts 'Ignoring error'
        end
      end
      ScheduleTailoringMailer.schedule_tailoring_email(info[:name], info[:email], info[:zip_code], info[:phone_number]).deliver
      redirect_to '/shop/suits', notice: 'We have received your request to schedule a tailoring. A Tailored Republic representative will contact you with details in the next 24 hours.'
    else
      render :schedule_tailoring
    end
  end

  def top_picks
    @top_picks = Product.top_picks
  end
end