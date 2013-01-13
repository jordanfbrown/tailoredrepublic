class RemoveEmailAndTokenFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :stripe_card_token
    remove_column :orders, :email
  end
end
