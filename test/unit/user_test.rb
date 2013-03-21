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

  test "a new user should automatically have a role equal to 'user'" do
    user = User.create(name: 'Bob', email: 'foo@bar.com', password: 'abc123', sign_up_method: User::SIGN_UP_METHOD_REGISTRATION)
    assert_equal user.role, 'user'
  end

  test "find_by_referral_code should return the correct user" do
    user = users(:user_with_stripe)
    code = user.referral_code
    assert_equal user, User.find_by_referral_code(code)
  end

  test "a user should only be able to review a product once" do
    user = users(:user_without_stripe)
    product = products(:hustler)
    assert user.can_review_product?(product)
    user.reviews.create(product_id: product.id, rating: 5, summary: 'Really great suit', status: 'accepted')
    assert !user.can_review_product?(product)
  end
end