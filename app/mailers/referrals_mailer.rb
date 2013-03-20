class ReferralsMailer < ActionMailer::Base
  default from: '"Tailored Republic" <referrals@tailoredrepublic.com>'

  def invite_friends_email(user, recipients, message)
    @user = user
    @message = message
    mail bcc: recipients, subject: 'Invitation to check out Tailored Republic'
  end

  def purchase_completed_email(referral)
    @referrer = referral.referrer
    @referee = referral.referee
    mail to: @referrer.email, subject: "You've Earned Tailored Republic Referral Credit"
  end

  def account_created_email(referral)
    @referrer = referral.referrer
    @referee = referral.referee
    mail to: @referee.email, subject: "You've Earned Tailored Republic Referral Credit"
  end

end
