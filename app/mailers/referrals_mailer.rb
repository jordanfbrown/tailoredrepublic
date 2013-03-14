class ReferralsMailer < ActionMailer::Base
  default from: "referrals@tailoredrepublic.com"

  def invite_friends_email(user, recipients, message)
    @user = user
    @message = message
    mail bcc: recipients, subject: 'Invitation to check out Tailored Republic'
  end

end
