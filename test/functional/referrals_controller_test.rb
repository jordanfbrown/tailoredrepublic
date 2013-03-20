require 'test_helper'

class ReferralsControllerTest < ActionController::TestCase
  test 'going to the invite page should set a referred_by id in the session' do
    user = users(:user_with_stripe)
    get :invite, { referral_code: user.referral_code }
    assert_equal session[:referred_by], user.id
    assert_response :redirect
    assert_redirected_to root_path
  end

  test 'going to index should redirect user to home page if not logged in' do
    get :index
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test 'going to index should work if user is signed in' do
    user = users(:user_with_stripe)
    sign_in :user, user
    get :index
    assert_not_nil assigns(:referrals)
    assert_not_nil assigns(:referral_email)
    assert_equal user, assigns(:user)
    assert_response :success
  end

  test 'posting to email_friends should create a new ReferralEmail and send an email to the email addresses list' do
    user = users(:user_with_stripe)
    sign_in :user, user
    referral_email_count = ReferralEmail.count
    referral_email_params = {
      email_addresses: 'jordan@tailoredrepublic.com',
      message: 'Hello'
    }
    post :email_friends, { referral_email: referral_email_params }
    assert_equal ReferralEmail.count, referral_email_count + 1
    assert_equal ReferralEmail.last.email_addresses, referral_email_params[:email_addresses]
    mail = ActionMailer::Base.deliveries.last
    assert_equal referral_email_params[:email_addresses], mail['bcc'].to_s
    assert_response :redirect
    assert_redirected_to referrals_path
  end
end
