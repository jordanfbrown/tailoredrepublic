class AddReferralDiscountToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :referral_discount, :integer
  end
end
