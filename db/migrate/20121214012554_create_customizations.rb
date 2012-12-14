class CreateCustomizations < ActiveRecord::Migration
  def change
    create_table :customizations do |t|
      t.string :lapel
      t.integer :buttons
      t.integer :vents
      t.integer :pleats
      t.boolean :pant_cuffs
      t.string :fit
      t.integer :lining
      t.string :monogram
      t.boolean :bouttoniere
      t.boolean :pick_stitching
      t.integer :vest_buttons

      t.timestamps
    end
  end
end
