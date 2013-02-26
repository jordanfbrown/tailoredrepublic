class AddTopPickToProducts < ActiveRecord::Migration
  def change
    add_column :products, :top_pick, :boolean

    Product.all.each do |p|
      p.update_attributes!(top_pick: false)
    end
  end
end
