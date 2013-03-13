require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "add_referrer should add a new row to the referrals table" do
    user = users(:user_with_stripe)
    referrer = users(:user_without_stripe)
    referral_count = Referral.count
    user.add_referrer(referrer.id)
    assert_equal Referral.count, referral_count + 1
    assert_equal Referral.last.referee, user
    assert_equal Referral.last.referrer, referrer
  end
end