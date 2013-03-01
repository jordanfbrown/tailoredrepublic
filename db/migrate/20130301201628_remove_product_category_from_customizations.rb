class RemoveProductCategoryFromCustomizations < ActiveRecord::Migration
  def up
    remove_column :customizations, :product_category
  end

  def down
    add_column :customizations, :product_category, :string
  end
end
