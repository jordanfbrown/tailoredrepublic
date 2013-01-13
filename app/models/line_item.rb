class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product, :customization
  belongs_to :cart
  belongs_to :product
  belongs_to :customization, dependent: :destroy
  belongs_to :order

  def total_price
    (product.price + (customization.vest? ? Product.vest_price : 0)).to_i
  end
end
