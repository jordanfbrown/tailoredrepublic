class ShopController < ApplicationController
  def index
    @category = Product.depluralize_category(params[:category])
    if @category == :error
      redirect_to shop_path
    end
    @products = Product.where(category: @category).order('name ASC').includes(:product_images).to_a
    # Temporarily adding this check because Rosemead and Malibu are the only shirts we have real images for, so we
    # want them to appear before all the other shirts
    if @category == :shirt
      @products.select { |p| p.name == 'The Rosemead' || p.name == 'The Malibu'}.each do |shirt|
        @products.delete(shirt)
        @products.prepend(shirt)
      end
    end
    @display_category = params[:category].blank? ? 'Suits' : params[:category].capitalize
  end

  def gift_cards
    @gift_cards = Product.where(category: :gift_card)
  end
end
