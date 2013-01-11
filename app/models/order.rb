class Order < ActiveRecord::Base
  has_one :shipping_address, as: :addressable
  has_one :billing_address, as: :addressable
  has_one :user

  attr_accessible :stripe_card_token, :email
end
