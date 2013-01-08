class RenameSleevesInMeasurements < ActiveRecord::Migration
  def change
    rename_column :measurements, :sleeves, :jacket_length
  end
end
