class ProductImage < ActiveRecord::Base
  belongs_to :product
  attr_accessible :large, :product_id, :regular, :thumbnail, :default
end
