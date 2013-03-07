class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  delegate :empty?, to: :line_items

  def num_items
    line_items.length
  end

  def total_price
    if empty?
      0
    else
      line_items.map { |c| c.total_price }.sum.to_i
    end
  end

  def shirt_only?
    !line_items.any? { |l| l.product.category == :suit } && line_items.any? { |l| l.product.category == :shirt }
  end

  def line_items_light
    line_items.map do |l|
      { id: l.id, total_price: l.total_price, quantity: l.quantity, unit_price: l.unit_price, category: l.category }
    end
  end

  # Can skip measurements if there are no suits or shirts in the cart
  def skip_measurements?
    !line_items.any? { |l| l.product.category == :suit || l.product.category == :shirt }
  end
end
