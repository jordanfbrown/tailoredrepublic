class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.text :description
      t.enum :status
      t.string :phone

      t.timestamps
    end
  end
end
