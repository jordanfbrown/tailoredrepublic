class AddCouponIndexToOrders < ActiveRecord::Migration
  def change
    add_index :orders, :coupon_id
  end
end
