class UpdateVestType < ActiveRecord::Migration
  def change
    remove_column :customizations, :vest
    add_column :customizations, :vest, :integer
  end
end
