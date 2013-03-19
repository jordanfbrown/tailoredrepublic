class PagesController < ApplicationController
  def top_picks
    @top_picks = Product.top_picks
  end

  def admin
    unless user_signed_in? && current_user.role == 'admin'
      redirect_to root_url
    end
  end
end