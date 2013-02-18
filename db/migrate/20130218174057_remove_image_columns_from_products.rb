class RemoveImageColumnsFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :image_large_url, :image_small_1_url, :image_small_2_url, :image_small_3_url,
                  :image_small_4_url
  end
end
