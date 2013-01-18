class AddIndicesToTables < ActiveRecord::Migration
  def change
    add_index :addresses, :addressable_id
    add_index :addresses, :addressable_type
    add_index :line_items, :product_id
    add_index :line_items, :customization_id
    add_index :line_items, :order_id
    add_index :line_items, :cart_id
    add_index :measurements, :order_id
    add_index :measurements, :user_id
    add_index :orders, :user_id
  end
end
