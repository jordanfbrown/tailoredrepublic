class TapeMeasureMailer < ActionMailer::Base
  default from: "no-reply@tailoredrepublic.com"

  def tape_measure_email(tape_measure_request)
    @tape_measure_request = tape_measure_request
    mail(to: 'jordan@tailoredrepublic.com, brian@tailoredrepublic.com, jeff@tailoredrepublic.com',
         subject: "New Tape Measure Request (#{Rails.env})")
  end
end
