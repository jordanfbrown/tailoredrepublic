require 'enumerated_attribute'

class Product < ActiveRecord::Base
  enum_attr :category, %w(suit shirt accessory gift_card)
  attr_accessible :description, :name, :price, :quantity, :category, :summary, :display_order, :top_pick, :subcategory,
                  :fabric_id, :product_photos_attributes

  has_many :line_items
  has_many :customizations
  has_many :reviews
  has_many :product_photos, order: 'default_photo DESC, created_at ASC', dependent: :destroy
  has_many :coupons, foreign_key: 'apply_to_product_id', class_name: 'Coupon'

  accepts_nested_attributes_for :product_photos, allow_destroy: true

  before_destroy :ensure_not_referenced_by_line_item

  extend FriendlyId
  friendly_id :name, use: :slugged

  def self.vest_price
    79
  end

  def self.pick_stitching_price
    10
  end

  def self.shirt_monogram_price
    5
  end

  def self.depluralize_category(category)
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
    self.where(top_pick: true).order('display_order ASC').limit(4)
  end

  def self.suggested(product_id)
    product = Product.find(product_id)
    suggested = []
    case product.category
      when :suit
        suggested << Product.random_by_category(:accessory)
        suggested << Product.random_by_category(:shirt)
      when :shirt
        suggested << Product.random_by_category(:accessory)
        suggested << Product.random_by_category(:suit)
      when :accessory
        suggested << Product.random_by_category(:suit)
        suggested << Product.random_by_category(:shirt)
      else
        suggested << Product.random_by_category(:shirt)
        suggested << Product.random_by_category(:suit)
    end
    suggested.flatten
  end

  def self.random_by_category(category)
    # Exclude Build Your Own Suit as a suggested product
    Product.where('category = ? AND name != ?', category, 'Build Your Own Suit').shuffle[0,2]
  end

  def as_json(options = {})
    json = super(options)
    json[:product_photos] = product_photos.map do |photo|
      {
        id: photo.id,
        original: photo.photo.url(:original),
        medium: photo.photo.url(:medium),
        small: photo.photo.url(:small),
        default_photo: photo.default_photo
      }
    end
    json
  end

  def self.by_category_and_subcategory(category, subcategory)
    query = where(category: category)
    query = query.where(subcategory: subcategory) if subcategory
    query.order('display_order ASC, subcategory ASC, name ASC').includes(:product_photos).to_a
  end

  def self.subcategories_for_category(category)
    Product.where(category: category).select(:subcategory).uniq.map { |p| p.subcategory }
  end

  def display_price
    price.to_i
  end

  def default_photo
    product_photos.find_by_default_photo(true)
  end

  def customizable?
    category == :suit || category == :shirt
  end

  def to_s
    name
  end

  def paginated_reviews(page = 1)
    reviews.accepted.includes(:user).paginate(page: page, per_page: 5).order('created_at DESC')
  end

  def average_rating
    accepted_reviews = reviews.accepted
    if accepted_reviews.length > 0
      (accepted_reviews.average('rating') * 2).round / 2.0 # Round to nearest 0.5
    else
      0
    end
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
