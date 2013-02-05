class RemoveVestButtonsFromCustomizations < ActiveRecord::Migration
 def change
   remove_column :customizations, :vest_buttons
 end
end
