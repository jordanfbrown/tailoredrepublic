class CreateScheduleTailorRequests < ActiveRecord::Migration
  def change
    create_table :schedule_tailor_requests do |t|
      t.string :email
      t.string :ip_address
      t.string :status

      t.timestamps
    end
  end
end
