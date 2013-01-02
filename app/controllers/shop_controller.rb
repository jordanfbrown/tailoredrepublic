class ShopController < ApplicationController
  def index
    @products = Product.where(category: :suit)
  end
end
