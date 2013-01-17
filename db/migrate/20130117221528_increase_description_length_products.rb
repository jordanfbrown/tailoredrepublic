class IncreaseDescriptionLengthProducts < ActiveRecord::Migration
  def change
    change_column :products, :description, :string, limit: 1000
  end
end
