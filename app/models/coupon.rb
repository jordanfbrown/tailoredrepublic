class Coupon < ActiveRecord::Base
  APPLY_TO_OPTIONS = %w(order category subcategory product customization)

  has_many :orders
  belongs_to :apply_to_product, foreign_key: 'apply_to_product_id', class_name: 'Product'
  belongs_to :generating_order, foreign_key: 'generated_by_order_id', class_name: 'Order'
  attr_accessible :begin_date, :coupon_type, :description, :discount_type, :end_date, :amount, :quantity, :code,
                  :apply_to_type, :apply_to_product_id, :apply_to_group, :max_items

  validates :coupon_type, inclusion: { in: %w(gift_card promotion), message: "%{value} is not a valid coupon type" }
  validates :discount_type, inclusion: { in: %w(fixed percentage), message: "%{value} is not a valid discount type" }
  validates :apply_to_type, inclusion: { in: APPLY_TO_OPTIONS,
                                    message: "%{value} is not a valid apply_to type" }
  validates :code, :description, :quantity, :coupon_type, :discount_type, :amount, presence: true
  validates :amount, :quantity, numericality: { greater_than_or_equal_to: 0 }

  def self.create_coupons_from_order(order)
    order.gift_cards.each do |gift_card|
      gift_card.quantity.times do
        coupon = Coupon.create!(coupon_type: 'gift_card', description: "$#{gift_card.product.display_price} Gift Card",
                               discount_type: 'fixed', amount: gift_card.product.price, quantity: 1,
                               apply_to_type: 'order', code: Coupon.generate_code)
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

  def calculate_discount(line_items)
    case apply_to_type
      when 'order'
        discount_for_order(line_items)
      when 'category'
        discount_for_category(line_items)
      when 'subcategory'
        discount_for_category(line_items)
      when 'product'
        discount_for_category(line_items)
      when 'customization'
        discount_for_customization(line_items)
      else
        0
      end
    end

  def discount_for_order(line_items)
    line_item_total = LineItem.sum_price(line_items)
    if discount_type == 'fixed'
      amount > line_item_total ? line_item_total : amount
    elsif discount_type == 'percentage'
      (line_item_total * amount * 0.01).round(2)
    end
  end

  # Given an array of line items, calculate the total discount
  #
  # If the coupon has max_items set to n, it will only apply to the first n instances of line items whose category,
  # subcategory, or product matches apply_to_product or apply_to_group
  #
  # A line item with quantity > 1 gets counted n times, where quantity = n
  #
  # Line items are sorted by unit price so that the coupon will apply to the most expensive items first (if there is
  # a limit to the number of items that the coupon can apply to)
  def discount_for_category(line_items)
    item_counter = max_items || 1000
    product_or_group = apply_to_type == 'product' ? apply_to_product.name : apply_to_group
    line_items
      .select { |l| l.send(apply_to_type).to_s == product_or_group }
      .sort_by { |l| -l.unit_price }
      .take(max_items.nil? ? 1000 : max_items)
      .reduce(0) do |sum, line_item|
        total_quantity = max_items.nil? ? line_item.quantity : [item_counter, line_item.quantity].min
        if item_counter < 1
          # If we've gone over our limit for max_items, don't add anymore to the discount
          sum
        else
          item_counter -= total_quantity
          total_amount = amount * total_quantity
          if discount_type == 'fixed'
            sum + (total_amount > line_item.total_price ? line_item.total_price : total_amount)
          elsif discount_type == 'percentage'
            sum + (line_item.unit_price * total_quantity * amount * 0.01).round(2)
          end
        end
    end
  end

  def discount_for_customization(line_items)
    select_function = apply_to_group == 'vest' ? 'has_vest?' : 'pick_stitching?'
    customization_price = apply_to_group == 'vest' ? Product.vest_price : Product.pick_stitching_price
    line_items.select { |l| l.customization.send(select_function) }.reduce(0) do |sum, line_item|
      if discount_type == 'fixed'
        sum + (amount > customization_price ? customization_price : amount) * line_item.quantity
      elsif discount_type == 'percentage'
        sum + (customization_price * amount * 0.01).round(2) * line_item.quantity
      end
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
