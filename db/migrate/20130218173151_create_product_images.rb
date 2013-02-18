class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.integer :product_id
      t.string :thumbnail
      t.string :regular
      t.string :large

      t.timestamps
    end
  end
end
