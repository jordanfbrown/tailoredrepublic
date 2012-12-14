class CartItem < ActiveRecord::Base
  attr_accessible :cart_id, :customization_id, :product_id
  belongs_to :cart
  belongs_to :product
  belongs_to :customization
end
