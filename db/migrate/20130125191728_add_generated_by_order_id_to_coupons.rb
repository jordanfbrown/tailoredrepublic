class AddGeneratedByOrderIdToCoupons < ActiveRecord::Migration
  def change
    add_column :coupons, :generated_by_order_id, :integer
  end
end
