class AddPrecisionsToMoneyColumns < ActiveRecord::Migration
  def change
    change_column :orders, :discount, :decimal, precision: 10, scale: 2
    change_column :orders, :tax, :decimal, precision: 10, scale: 2
    change_column :orders, :final_cost, :decimal, precision: 10, scale: 2
    change_column :products, :price, :decimal, precision: 10, scale: 2
  end
end
