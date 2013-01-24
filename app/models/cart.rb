class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def empty?
    line_items.empty?
  end

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

  # Can skip measurements if there are no suits or shirts in the cart
  def skip_measurements?
    !line_items.any? { |l| l.product.category == :suit } && !line_items.any? { |l| l.product.category == :shirt }
  end
end
