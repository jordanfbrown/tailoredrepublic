class AddOrderIdToMeasurement < ActiveRecord::Migration
  def change
    add_column :measurements, :order_id, :integer
  end
end
