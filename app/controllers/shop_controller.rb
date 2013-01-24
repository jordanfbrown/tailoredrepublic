class ShopController < ApplicationController
  def index
    category = Product.depluralize_category(params[:category])
    @products = Product.where(category: category)
    @display_category = params[:category].blank? ? 'Suits' : params[:category].capitalize
  end

  def gift_cards
    @gift_cards = Product.where(category: :gift_card)
  end
end
