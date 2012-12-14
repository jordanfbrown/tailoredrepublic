class Cart < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy

  def empty?
    cart_items.empty?
  end

  def num_items
    cart_items.length
  end
end
