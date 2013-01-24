class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :code
      t.string :description
      t.integer :quantity
      t.string :coupon_type
      t.string :discount_type
      t.integer :amount
      t.datetime :begin_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
