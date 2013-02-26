class ScheduleTailoringMailer < ActionMailer::Base
  default from: "no-reply@tailoredrepublic.com"

  def schedule_tailoring_email(name, email, zip_code, phone_number)
    @name = name
    @email = email
    @zip_code = zip_code
    @phone_number = phone_number
    mail(to: 'jordan@tailoredrepublic.com, jeff@tailoredrepublic.com, brian@tailoredrepublic.com',
         subject: 'Schedule Tailoring Request')
  end
end
