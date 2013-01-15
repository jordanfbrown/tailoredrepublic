class ChangeStripeTokenToChargeId < ActiveRecord::Migration
  def change
    rename_column :orders, :stripe_card_token, :stripe_charge_id
  end
end
