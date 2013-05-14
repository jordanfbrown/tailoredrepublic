class PagesController < ApplicationController
  def top_picks
    @top_picks = Product.top_picks
  end

  def graduation
    @product = Product.where(category: :suit).order('price ASC').first
    @gift_cards = Product.order('price ASC').where(category: :gift_card)
    @selected_gift_card = @gift_cards.find { |g| g.price == 349 }.id
    puts @selected_gift_card
    @testimonials = Testimonial.paginate(page: params[:page] ||= 1, per_page: 15)
  end

  def admin
    unless user_signed_in? && current_user.admin?
      redirect_to root_url
    end
  end
end