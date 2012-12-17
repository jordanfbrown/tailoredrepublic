class CartItem < ActiveRecord::Base
  attr_accessible :cart_id, :product, :customization
  belongs_to :cart
  belongs_to :product
  belongs_to :customization
end
