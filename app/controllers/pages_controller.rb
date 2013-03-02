class PagesController < ApplicationController
  def top_picks
    @top_picks = Product.top_picks
  end
end