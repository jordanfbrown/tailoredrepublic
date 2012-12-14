class HomeController < ApplicationController
  def index
    @item_count = 0
    @cart = current_cart
  end
end
