class CartItem < ActiveRecord::Base
  attr_accessible :cart_id, :product, :customization
  belongs_to :cart
  belongs_to :product
  belongs_to :customization

  def total_price
    (product.price + (customization.vest? ? 79 : 0)).to_i
  end
end
