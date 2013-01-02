class HomeController < ApplicationController
  def index
    @item_count = 0
    @top_picks = Product.all(limit: 4)
  end
end
