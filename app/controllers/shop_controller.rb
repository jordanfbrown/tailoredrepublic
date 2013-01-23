class ShopController < ApplicationController
  def index
    category = Product.depluralize_category params[:category]
    @products = Product.where(category: category)
    @display_category = params[:category].capitalize
  end
end
