class Order < ActiveRecord::Base
  has_one :shipping_address, as: :addressable, validate: true
  has_one :billing_address, as: :addressable, validate: true
  has_one :measurement
  belongs_to :user
  belongs_to :coupon
  has_many :line_items
  has_many :generated_coupons, foreign_key: 'generated_by_order_id', class_name: 'Coupon'

  attr_accessible :shipping_address_attributes, :billing_address_attributes
  validates_presence_of :shipping_address, :billing_address, :user, :line_items, :measurement
  delegate :description, :amount, to: :coupon, prefix: true

  accepts_nested_attributes_for :shipping_address, :billing_address

  self.per_page = 5

  def self.new_order(order_params, user, cart)
    order = Order.new(order_params)
    order.user = user
    order.measurement = user.duplicate_measurement
    order.copy_line_items_from_cart(cart)
    order
  end

  def self.paginated_orders(page)
    Order.includes({ line_items: [:product, :customization] }, :shipping_address, :billing_address, :measurement)
         .paginate(page: page).order('created_at DESC')
  end

  def self.generate_id
    'or_' + ('a'..'z').to_a.concat((0..9).to_a).concat(('A'..'Z').to_a).shuffle[0,14].join
  end

  def copy_line_items_from_cart(cart)
    cart.line_items.each do |line_item|
      line_item.cart_id = nil
      line_items << line_item
    end
  end

  def build_address_from_address(address)
    unless address.blank?
      new_address = self.send("build_#{address.type.underscore}")
      new_address.line1 = address.line1
      new_address.line2 = address.line2
      new_address.city = address.city
      new_address.state = address.state
      new_address.zip = address.zip
      new_address.name = address.name
    end
  end

  def line_item_total
    line_items.map { |c| c.total_price }.sum.to_i
  end

  def cost_before_tax
    total = line_item_total

    unless coupon.nil?
      discount = coupon.calculate_discount(total)
      total -= discount
    end

    total
  end

  def has_gift_cards?
    gift_cards.length > 0
  end

  def gift_cards
    line_items.select { |l| l.product.category == :gift_card }
  end

  def apply_coupon(coupon)
    self.coupon = coupon
    self.discount = coupon.calculate_discount(line_item_total)
  end

  def apply_tax
    self.tax = ((shipping_address.state == 'CA' ? 0.09 : 0) * cost_before_tax).round(2)
    self.final_cost = self.tax + cost_before_tax
  end

  after_rollback do |order|
    if order.order_id?
      charge = Stripe::Charge.retrieve(order.order_id)
      charge.refund
    end
  end

end
