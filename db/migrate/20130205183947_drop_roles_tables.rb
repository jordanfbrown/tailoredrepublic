class DropRolesTables < ActiveRecord::Migration
  def change
    drop_table :roles
    drop_table :users_roles
    add_column :users, :role, :string
  end
end
