class AddZipNamePhoneToScheduleTailorRequests < ActiveRecord::Migration
  def change
    add_column :schedule_tailor_requests, :zip, :string
    add_column :schedule_tailor_requests, :name, :string
    add_column :schedule_tailor_requests, :phone, :string
  end
end
