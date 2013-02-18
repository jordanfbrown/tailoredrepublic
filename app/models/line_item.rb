class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product, :customization, :cart, :order
  belongs_to :cart
  belongs_to :product
  belongs_to :customization, dependent: :destroy
  belongs_to :order

  delegate :name, :summary, :category, to: :product

  def total_price
    if customization.nil?
      product.price.to_i
    else
      adders = 0
      adders += Product.vest_price if customization.vest?
      adders += Product.pick_stitching_price if customization.pick_stitching?
      adders += Product.shirt_monogram_price if customization.shirt_monogram?
      (product.price + adders).to_i
    end
  end
end
