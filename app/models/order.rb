class Order < ActiveRecord::Base
  has_one :shipping_address, as: :addressable, validate: true
  has_one :billing_address, as: :addressable, validate: true
  has_one :measurement
  belongs_to :user
  belongs_to :coupon
  has_many :line_items

  attr_accessible :shipping_address_attributes, :billing_address_attributes
  validates_presence_of :shipping_address, :billing_address, :user, :line_items, :measurement

  accepts_nested_attributes_for :shipping_address, :billing_address

  self.per_page = 5

  def self.new_order(order_params, user, cart)
    order = Order.new(order_params)
    order.user = user
    order.measurement = user.duplicate_measurement
    order.copy_line_items_from_cart(cart)
    order.final_cost = order.total_cost
    order
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

  def total_cost
    total = cost_before_discount

    unless coupon.nil?
      coupon_discount = coupon.calculate_discount(total)
      total -= coupon_discount
      total = 0 if total < 0
    end

    total
  end

  def cost_before_discount
    line_items.map { |c| c.total_price }.sum.to_i
  end

  def calculate_discount
    if coupon.nil?
      0
    else
      coupon_discount = coupon.calculate_discount(cost_before_discount)
      if coupon_discount > cost_before_discount
        coupon_discount = cost_before_discount
      end
      coupon_discount
    end
  end

  after_rollback do |order|
    unless order.stripe_charge_id.blank?
      charge = Stripe::Charge.retrieve order.stripe_charge_id
      charge.refund
    end
  end
end
