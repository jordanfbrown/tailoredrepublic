class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :stripe_card_token
      t.string :email

      t.timestamps
    end
  end
end
