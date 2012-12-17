class HomeController < ApplicationController
  def index
    @item_count = 0
    @cart = current_cart
    @top_picks = Product.all(limit: 4)
  end
end
