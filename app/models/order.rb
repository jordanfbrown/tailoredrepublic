class Order < ActiveRecord::Base
  has_one :shipping_address, as: :addressable
  has_one :billing_address, as: :addressable
  belongs_to :user
  has_many :line_items
  has_one :measurement

  validates_presence_of :shipping_address, :billing_address, :user, :line_items, :measurement

  def self.new_order(params, user, cart)
    order = Order.new
    order.build_billing_address params[:billing_address]
    order.build_shipping_address params[:shipping_address]
    order.user = user
    order.measurement = user.measurement.dup
    order.copy_line_items_from_cart cart
    order
  end

  def copy_line_items_from_cart(cart)
    cart.line_items.each do |line_item|
      line_item.cart_id = nil
      line_items << line_item
    end
  end

  def build_address_from_address(address_type, address)
    if %w(shipping billing).include? address_type
      new_address = self.send("build_#{address_type}_address")
      unless address.nil?
        new_address.line1 = address.line1
        new_address.line2 = address.line2
        new_address.city = address.city
        new_address.state = address.state
        new_address.zip = address.zip
        new_address.name = address.name
      end
    else
      raise "build_address_from_address must take a first argument of 'shipping' or 'billing'"
    end
  end

  after_rollback do |order|
    charge = Stripe::Charge.retrieve order.stripe_charge_id
    charge.refund
  end
end
