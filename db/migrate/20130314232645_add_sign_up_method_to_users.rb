class AddSignUpMethodToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sign_up_method, :string
  end
end
