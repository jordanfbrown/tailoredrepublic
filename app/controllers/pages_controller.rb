class PagesController < ApplicationController
  caches_page :faq

  def measuring_tape
    @address = Address.new
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
end