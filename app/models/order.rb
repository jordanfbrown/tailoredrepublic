class Order < ActiveRecord::Base
  has_one :shipping_address, as: :addressable
  has_one :billing_address, as: :addressable
  belongs_to :user
  has_many :line_items
end
