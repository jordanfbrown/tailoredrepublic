class AddVestToCustomizations < ActiveRecord::Migration
  def change
    change_table :customizations do |t|
      t.boolean :vest
    end
  end
end
