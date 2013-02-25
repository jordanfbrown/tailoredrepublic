class Coupon < ActiveRecord::Base
  has_many :orders
  belongs_to :generating_order, foreign_key: 'generated_by_order_id', class_name: 'Order'
  attr_accessible :begin_date, :coupon_type, :description, :discount_type, :end_date, :amount, :quantity, :code

  validates :coupon_type, inclusion: { in: %w(gift_card promotion), message: "%{value} is not a valid coupon type" }
  validates :discount_type, inclusion: { in: %w(fixed percentage), message: "%{value} is not a valid discount type" }
  validates :code, :description, :quantity, :coupon_type, :discount_type, :amount, presence: true
  validates :amount, :quantity, numericality: { greater_than_or_equal_to: 0 }

  def self.create_coupons_from_order(order)
    order.gift_cards.each do |gift_card|
      gift_card.quantity.times do
        coupon = Coupon.create!(coupon_type: 'gift_card', description: "$#{gift_card.product.display_price} Gift Card",
                               discount_type: 'fixed', amount: gift_card.product.price, quantity: 1,
                               code: Coupon.generate_code)
        order.generated_coupons << coupon
      end
    end
  end

  def self.generate_code
    code = ('A'..'Z').to_a.shuffle[0,8].join
    if self.find_by_code(code).nil?
      code
    else
      self.generate_code
    end
  end

  def invalid?
    quantity == 0 || (!end_date.nil? && Date.today > end_date) || (!begin_date.nil? && begin_date > Date.today)
  end

  def calculate_discount(line_item_total)
    if discount_type == 'fixed'
      amount > line_item_total ? line_item_total : amount
    elsif discount_type == 'percentage'
      (line_item_total * amount * 0.01).round(2)
    end
  end

  def update_amount!(order)
    if coupon_type == 'promotion'
      self.quantity -= 1
    elsif self.coupon_type == 'gift_card'
      self.amount -= order.discount
      if self.amount <= 0
        self.quantity -= 1
      end
    end
    save
  end

end
