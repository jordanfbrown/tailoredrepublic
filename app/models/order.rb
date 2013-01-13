class Order < ActiveRecord::Base
  has_one :shipping_address, as: :addressable
  has_one :billing_address, as: :addressable
  belongs_to :user
  has_many :line_items

  def copy_line_items_from_cart(cart)
    cart.line_items.each do |line_item|
      line_item.cart_id = nil
      line_items << line_item
    end
    cart.destroy
  end
end
