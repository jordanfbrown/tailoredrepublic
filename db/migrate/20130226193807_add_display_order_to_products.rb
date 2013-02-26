class AddDisplayOrderToProducts < ActiveRecord::Migration
  def change
    add_column :products, :display_order, :integer

    Product.all.each do |p|
      p.update_attributes!(display_order: 1)
    end
  end
end
