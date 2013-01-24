class Coupon < ActiveRecord::Base
  has_many :orders

  attr_accessible :begin_date, :coupon_type, :description, :discount_type, :end_date, :amount, :quantity

  validates :coupon_type, inclusion: { in: %w(gift_card promotion), message: "%{value} is not a valid coupon type" }
  validates :discount_type, inclusion: { in: %w(fixed percentage), message: "%{value} is not a valid discount type" }

  def self.get_by_code(code)
    Coupon.where(code: code).first
  end

  def generate_code
    ('A'..'Z').to_a.shuffle[0,8].join
  end

  def invalid?
    quantity == 0 || (!end_date.nil? && Date.today > end_date)
  end

  def calculate_discount(order)
    if discount_type == 'fixed'
      amount
    elsif discount_type == 'percentage'
      order.total_price * amount * 0.01
    end
  end

end
