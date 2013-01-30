class AddFabricToCustomization < ActiveRecord::Migration
  def change
    add_column :customizations, :fabric, :string
  end
end
