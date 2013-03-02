class ScheduleTailorRequestObserver < ActiveRecord::Observer
  def after_create(schedule_tailor_request)
    ScheduleTailorRequestMailer.schedule_tailor_email(schedule_tailor_request).deliver
  end
end
