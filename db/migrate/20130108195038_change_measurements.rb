class ChangeMeasurements < ActiveRecord::Migration
  def change
    rename_column :measurements, :shoulders, :full_shoulders
    rename_column :measurements, :length, :arm_length
    add_column    :measurements, :pant_length, :decimal
    remove_column :measurements, :cuff
  end
end
