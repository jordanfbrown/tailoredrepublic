class ChangeCartItemToLineItem < ActiveRecord::Migration
  def change
    rename_table :cart_items, :line_items
  end
end
