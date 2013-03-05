class ShopController < ApplicationController
  def index
    @category = Product.depluralize_category(params[:category])
    if @category == :error
      redirect_to '/shop/suits' and return
    end
    @products = Product.by_category(@category)
    @display_category = params[:category].capitalize
  end

  def gift_cards
    @gift_cards = Product.order('price ASC').where(category: :gift_card)
  end
end
