class CreateTapeMeasureRequests < ActiveRecord::Migration
  def change
    create_table :tape_measure_requests do |t|
      t.string :email
      t.string :ip_address
      t.boolean :sent

      t.timestamps
    end
  end
end
