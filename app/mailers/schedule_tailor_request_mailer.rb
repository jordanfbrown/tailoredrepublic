class ScheduleTailorRequestMailer < ActionMailer::Base
  default from: "no-reply@tailoredrepublic.com"

  def schedule_tailor_email(schedule_tailor_request)
    @schedule_tailor_request = schedule_tailor_request
    mail(to: 'jordan@tailoredrepublic.com, jeff@tailoredrepublic.com, brian@tailoredrepublic.com',
         subject: "Schedule Tailoring Request (#{Rails.env})")
  end
end
