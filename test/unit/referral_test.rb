require 'test_helper'

class ReferralTest < ActiveSupport::TestCase
  test "order_completed should add $20 to the referrer's credit, and update status to STATUS_COMPLETED" do
    referral = referrals(:referral_created)
    referrer = referral.referrer
    referrer_credit = referrer.referral_credit

    referral.order_completed
    referral.reload
    referrer.reload

    assert_equal referral.status, Referral::STATUS_COMPLETED
    assert_equal referrer_credit + 20, referrer.referral_credit
  end

  test "order_completed should not credit the referrer if the current referral status is STATUS_COMPLETED" do
    referral = referrals(:referral_completed)
    referrer = referral.referrer
    referrer_credit = referrer.referral_credit

    referral.order_completed
    referrer.reload

    assert_equal referrer_credit, referrer.referral_credit
  end
end
