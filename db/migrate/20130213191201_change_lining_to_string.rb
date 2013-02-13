class ChangeLiningToString < ActiveRecord::Migration
  def change
    change_column :customizations, :lining, :string
  end
end
