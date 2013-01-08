class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.decimal :neck
      t.decimal :shoulders
      t.decimal :front
      t.decimal :back
      t.decimal :chest
      t.decimal :stomach
      t.decimal :waist
      t.decimal :length
      t.decimal :sleeves
      t.decimal :bicep
      t.decimal :wrist
      t.decimal :hips
      t.decimal :crotch
      t.decimal :thigh
      t.decimal :length
      t.decimal :cuff

      t.timestamps
    end
  end
end
