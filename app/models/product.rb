class Product < ActiveRecord::Base
  attr_accessible :description, :image_large_url, :image_small_1_url, :image_small_2_url, :image_small_3_url,
                  :image_small_4_url, :name, :price, :quantity, :type
end
