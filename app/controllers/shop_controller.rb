class ShopController < ApplicationController
  def index
    @category = Product.depluralize_category(params[:category])
    redirect_to '/shop/suits' and return if @category == :error
    @subcategory = params[:subcategory]
    @products = Product.by_category_and_subcategory(@category, @subcategory)
    @accessory_subcategories = Product.subcategories_for_category(:accessory)
    @shirt_subcategories = Product.subcategories_for_category(:shirt)
    @display_category = params[:category].capitalize
  end

  def gift_cards
    @gift_cards = Product.order('price ASC').where(category: :gift_card)
  end
end
