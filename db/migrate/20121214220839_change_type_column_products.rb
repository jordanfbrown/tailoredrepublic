class ChangeTypeColumnProducts < ActiveRecord::Migration
  def change
    rename_column :products, :type, :category
  end
end
