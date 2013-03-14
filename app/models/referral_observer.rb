class ReferralObserver < ActiveRecord::Observer
  def after_create(referral)
    ReferralsMailer.account_created_email(referral).deliver
  end

  def after_save(referral)
    if referral.status == Referral::STATUS_COMPLETED
      ReferralsMailer.purchase_completed_email(referral).deliver
    end
  end
end
