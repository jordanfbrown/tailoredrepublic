class CreateProductPhotos < ActiveRecord::Migration
  def change
    create_table :product_photos do |t|
      t.integer :product_id
      t.boolean :default_photo
      t.attachment :photo

      t.timestamps
    end
  end
end
