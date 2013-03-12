class AddApplyToFieldsToCoupons < ActiveRecord::Migration
  def change
    add_column :coupons, :apply_to_type, :string
    add_column :coupons, :apply_to_product_id, :integer
    add_column :coupons, :apply_to_group, :string

    add_index :coupons, :apply_to_product_id
  end
end
