class CreateReferralEmails < ActiveRecord::Migration
  def change
    create_table :referral_emails do |t|
      t.string :email_addresses
      t.string :message, limit: 500
      t.integer :user_id

      t.timestamps
    end
    add_index :referral_emails, :user_id
  end
end
