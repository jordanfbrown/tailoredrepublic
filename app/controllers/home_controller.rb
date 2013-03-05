class HomeController < ApplicationController
  def index
    @top_picks = Product.top_picks
  end
end
