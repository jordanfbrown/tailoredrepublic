class ChangeStripeChargeIdToOrderId < ActiveRecord::Migration
  def change
    rename_column :orders, :stripe_charge_id, :order_id
  end
end
