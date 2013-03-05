class CartsController < ApplicationController
  def show
    @line_items = @cart.line_items_light
    @skip_measurements = @cart.skip_measurements?
  end
end
