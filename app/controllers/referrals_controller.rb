class ReferralsController < ApplicationController
  def invite
    user = User.find_by_referral_code(params[:referral_code])
    session[:referred_by] = user.id unless user.nil?
    redirect_to root_path
  end

  def index

  end
end
