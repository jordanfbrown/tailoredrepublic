class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product, :customization, :cart, :order
  belongs_to :cart
  belongs_to :product
  belongs_to :customization, dependent: :destroy
  belongs_to :order

  delegate :image_large_url, :name, :summary, :category, to: :product

  def total_price
    if customization.nil?
      product.price.to_i
    else
      (product.price + (customization.vest? ? Product.vest_price : 0)).to_i
    end
  end
end
