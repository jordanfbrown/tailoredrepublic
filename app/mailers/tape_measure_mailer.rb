class TapeMeasureMailer < ActionMailer::Base
  default from: "no-reply@tailoredrepublic.com"

  def tape_measure_email(address)
    @address = address
    mail(to: 'jordan@tailoredrepublic.com', subject: 'New Tape Measure Request')
  end
end
