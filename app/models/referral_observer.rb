class ReferralObserver < ActiveRecord::Observer
  def after_create(referral)
    # If the new account was created from the order page, sending them an email about their referral credit would be
    # redundant because they have already seen their credit and most likely have already used it
    unless referral.referee.sign_up_method == User::SIGN_UP_METHOD_ORDER
      ReferralsMailer.account_created_email(referral).deliver
    end
  end

  def after_save(referral)
    if referral.status == Referral::STATUS_COMPLETED
      ReferralsMailer.purchase_completed_email(referral).deliver
    end
  end
end
