class AddMaxItemsToCoupons < ActiveRecord::Migration
  def change
    add_column :coupons, :max_items, :integer
  end
end
