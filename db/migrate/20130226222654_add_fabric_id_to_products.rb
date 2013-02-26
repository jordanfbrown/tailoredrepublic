class AddFabricIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :fabric_id, :string
  end
end
