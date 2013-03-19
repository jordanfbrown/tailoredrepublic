class TapeMeasureRequestObserver < ActiveRecord::Observer
  def after_create(tape_measure_request)
    TapeMeasureMailer.tape_measure_admin_email(tape_measure_request).deliver
    TapeMeasureMailer.tape_measure_user_email(tape_measure_request).deliver
  end
end
