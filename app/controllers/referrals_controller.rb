class ReferralsController < ApplicationController
  def invite
    user = User.find_by_referral_code(params[:referral_code])
    session[:referred_by] = user.id unless user.nil?
    redirect_to root_path
  end

  def index
    if user_signed_in?
      @user = current_user
      @referrals = current_user.referrals.includes(:referee)
      @referral_email = ReferralEmail.new
    else
      redirect_to root_path
    end
  end

  def email_friends
    if user_signed_in?
      @referral_email = ReferralEmail.new(params[:referral_email])
      @referral_email.user = current_user
      if @referral_email.save
        redirect_to referrals_path, notice: 'Thanks! An invitation to check out Tailored Republic has been sent to your friends.'
      else
        @user = current_user
        @referrals = current_user.referrals.includes(:referee)
        render :index
      end
    else
      redirect_to root_path
    end
  end
end
