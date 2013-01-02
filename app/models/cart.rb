class Cart < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy

  def empty?
    cart_items.empty?
  end

  def num_items
    cart_items.length
  end

  def total_price
    if empty?
      0
    else
      cart_items.map { |c| c.total_price }.sum.to_i
    end
  end
end
