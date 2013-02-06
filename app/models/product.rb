require 'enumerated_attribute'

class Product < ActiveRecord::Base
  enum_attr :category, %w(suit shirt accessory gift_card)
  attr_accessible :description, :image_large_url, :image_small_1_url, :image_small_2_url, :image_small_3_url,
                  :image_small_4_url, :name, :price, :quantity, :category
  has_many :line_items
  has_many :customizations
  before_destroy :ensure_not_referenced_by_line_item

  def self.vest_price
    79
  end

  def self.pick_stitching_price
    10
  end

  def self.num_measurements(shirt_only)
    shirt_only ? 12: 15
  end

  def self.depluralize_category(category)
    if category.blank?
      return :suit
    end

    case category
      when 'suits'
        :suit
      when 'shirts'
        :shirt
      when 'pants'
        :pants
      when 'accessories'
        :accessory
      else
        :error
    end
  end

  def self.top_picks
    # TODO: come up with real top picks instead of first 4 products
    self.all(limit: 4)
  end

  def self.suggested(product_id)
    # TODO: come up with real suggested products instead of first 4 products
    self.all(limit: 4)
  end

  def display_price
    price.to_i
  end

  private
    def ensure_not_referenced_by_line_item
      if line_items.empty?
        true
      else
        errors.add :base, 'Cart items present'
        false
      end
    end
end
