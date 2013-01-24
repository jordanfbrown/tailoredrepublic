class Coupon < ActiveRecord::Base
  attr_accessible :begin_date, :coupon_type, :description, :discount_type, :end_date, :amount, :quantity

  validates :coupon_type, inclusion: { in: %w(gift_card promotion), message: "%{value} is not a valid coupon type" }
  validates :discount_type, inclusion: { in: %w(fixed percentage), message: "%{value} is not a valid discount type" }

  def generate_code
    ('A'..'Z').to_a.shuffle[0,8].join
  end
end
