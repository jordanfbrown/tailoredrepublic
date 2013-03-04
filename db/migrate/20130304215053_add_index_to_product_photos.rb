class AddIndexToProductPhotos < ActiveRecord::Migration
  def change
    add_index :product_photos, :product_id
  end
end
