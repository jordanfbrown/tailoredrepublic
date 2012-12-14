class ShopController < ApplicationController
  def index
    @suits = Product.where(category: :suit)
  end
end
