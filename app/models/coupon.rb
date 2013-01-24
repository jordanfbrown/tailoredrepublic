class Coupon < ActiveRecord::Base
  has_many :orders

  attr_accessible :begin_date, :coupon_type, :description, :discount_type, :end_date, :amount, :quantity

  validates :coupon_type, inclusion: { in: %w(gift_card promotion), message: "%{value} is not a valid coupon type" }
  validates :discount_type, inclusion: { in: %w(fixed percentage), message: "%{value} is not a valid discount type" }

  def generate_code
    ('A'..'Z').to_a.shuffle[0,8].join
  end

  def invalid?
    quantity == 0 || (!end_date.nil? && Date.today > end_date) || (!begin_date.nil? && begin_date > Date.today)
  end

  def calculate_discount(cost_before_discount)
    if discount_type == 'fixed'
      amount
    elsif discount_type == 'percentage'
      cost_before_discount * amount * 0.01
    end
  end

  def apply_to_order(order)
    order.coupon = self
    order.discount = order.calculate_discount
    order.final_cost = order.total_cost

    if coupon_type == 'promotion'
      self.quantity -= 1
    elsif coupon_type == 'gift_card'
      self.amount -= order.cost_before_discount
      if self.amount <= 0
        self.quantity -= 1
      end
    end
    save
  end

end
