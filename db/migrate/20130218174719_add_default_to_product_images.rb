class AddDefaultToProductImages < ActiveRecord::Migration
  def change
    add_column :product_images, :default, :boolean
  end
end
