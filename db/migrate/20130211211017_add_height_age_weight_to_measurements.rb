class AddHeightAgeWeightToMeasurements < ActiveRecord::Migration
  def change
    add_column :measurements, :height, :integer
    add_column :measurements, :weight, :integer
    add_column :measurements, :age, :integer
  end
end
