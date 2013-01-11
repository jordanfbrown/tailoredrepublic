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
end
