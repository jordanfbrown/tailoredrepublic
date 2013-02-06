class RemoveBouttoniereFromCustomizations < ActiveRecord::Migration
  def change
    remove_column :customizations, :bouttoniere
  end
end
