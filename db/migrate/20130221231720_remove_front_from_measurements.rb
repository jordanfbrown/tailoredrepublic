class RemoveFrontFromMeasurements < ActiveRecord::Migration
  def up
    remove_column :measurements, :front
  end

  def down
    add_column :measurements, :front, :decimal
  end
end
