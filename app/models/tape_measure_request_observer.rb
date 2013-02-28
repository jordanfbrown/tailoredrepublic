class TapeMeasureRequestObserver < ActiveRecord::Observer
  def after_create(tape_measure_request)
    TapeMeasureMailer.tape_measure_email(tape_measure_request).deliver
  end
end
