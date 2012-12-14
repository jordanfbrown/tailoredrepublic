class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :type
      t.string :name
      t.string :description
      t.decimal :price
      t.integer :quantity
      t.string :image_large_url
      t.string :image_small_1_url
      t.string :image_small_2_url
      t.string :image_small_3_url
      t.string :image_small_4_url

      t.timestamps
    end
  end
end
