class AddShirtCustomizationOptions < ActiveRecord::Migration
  def change
    change_table :customizations do |t|
      t.column :collar, :string
      t.column :pocket, :boolean
      t.column :monogram_color, :string
      t.column :product_category, :string
    end
  end
end
