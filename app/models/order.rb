class Order < ActiveRecord::Base
  has_one :shipping_address, as: :addressable, validate: true
  has_one :billing_address, as: :addressable, validate: true
  belongs_to :user
  has_many :line_items
  has_one :measurement

  attr_accessible :shipping_address_attributes, :billing_address_attributes
  validates_presence_of :shipping_address, :billing_address, :user, :line_items, :measurement

  accepts_nested_attributes_for :shipping_address, :billing_address

  def self.new_order(order_params, user, cart, stripe_charge_id = nil)
    order = Order.new(order_params)
    order.user = user
    measurement = user.measurement.dup
    measurement.user_id = nil
    order.measurement = measurement
    order.copy_line_items_from_cart cart
    order.stripe_charge_id = stripe_charge_id unless stripe_charge_id.blank?
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

  after_rollback do |order|
    charge = Stripe::Charge.retrieve order.stripe_charge_id
    charge.refund
  end
end
