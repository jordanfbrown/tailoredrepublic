class TapeMeasureMailer < ActionMailer::Base
  default from: '"Tailored Republic" <tapemeasure@tailoredrepublic.com>'

  def tape_measure_admin_email(tape_measure_request)
    @tape_measure_request = tape_measure_request
    mail(to: 'tapemeasure@tailoredrepublic.com', subject: "New Tape Measure Request (#{Rails.env})")
  end

  def tape_measure_user_email(tape_measure_request)
    @tape_measure_request = tape_measure_request
    mail(to: @tape_measure_request.email, from: 'brian@tailoredrepublic.com',
         subject: "Tailored Republic Tape Measure Request Received")
  end
end
