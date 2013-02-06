class HomeController < ApplicationController
  def index
    @item_count = 0
    @top_picks = Product.top_picks
  end
end
