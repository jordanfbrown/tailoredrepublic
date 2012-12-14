require 'enumerated_attribute'

class Product < ActiveRecord::Base
  enum_attr :type, %w(suit pants vest jacket shirt)
  attr_accessible :description, :image_large_url, :image_small_1_url, :image_small_2_url, :image_small_3_url,
                  :image_small_4_url, :name, :price, :quantity, :type
  has_many :cart_items

  before_destroy :ensure_not_referenced_by_cart_item

  private
    def ensure_not_referenced_by_cart_item
      if cart_items.empty?
        true
      else
        errors.add :base, 'Cart items present'
        false
      end
    end
end
