class AddUserIdToMeasurements < ActiveRecord::Migration
  def change
    change_table :measurements do |t|
      t.references :user
    end
  end
end
