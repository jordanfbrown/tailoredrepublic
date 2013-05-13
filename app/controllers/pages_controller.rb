class PagesController < ApplicationController
  def top_picks
    @top_picks = Product.top_picks
  end

  def graduation
    @product = Product.where(category: :suit).first
    @gift_cards = Product.order('price ASC').where(category: :gift_card)
    #@gift_cards = gift_cards.map do |gift_card|
    #  { id: gift_card.id, price: "$#{gift_card.display_price}" }
    #end
  end

  def admin
    unless user_signed_in? && current_user.admin?
      redirect_to root_url
    end
  end
end