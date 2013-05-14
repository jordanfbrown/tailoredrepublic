class PagesController < ApplicationController

  before_filter :set_graduation_variables, only: [:graduation_without_clickable_product, :graduation_with_clickable_product]
  def top_picks
    @top_picks = Product.top_picks
  end

  def graduation_without_clickable_product
    @clickable = false
    render 'graduation'
  end

  def graduation_with_clickable_product
    @clickable = true
    render 'graduation'
  end

  def admin
    unless user_signed_in? && current_user.admin?
      redirect_to root_url
    end
  end

  private

  def set_graduation_variables
    @product = Product.where(category: :suit).order('price ASC').first
    @gift_cards = Product.order('price ASC').where(category: :gift_card)
    @selected_gift_card = @gift_cards.find { |g| g.price == 349 }.id
    @testimonials = Testimonial.paginate(page: params[:page] ||= 1, per_page: 15)
  end
end