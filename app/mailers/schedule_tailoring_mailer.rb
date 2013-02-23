class ScheduleTailoringMailer < ActionMailer::Base
  default from: "no-reply@tailoredrepublic.com"

  def schedule_tailoring_email(address, email)
    @address = address
    @email = email
    mail(to: 'jordan@tailoredrepublic.com, jeff@tailoredrepublic.com, brian@tailoredrepublic.com', subject: 'Schedule Tailoring Request')
  end
end
