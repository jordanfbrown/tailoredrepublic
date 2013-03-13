class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.integer :referrer_id
      t.integer :referee_id
      t.string :status

      t.timestamps
    end

    add_index :referrals, [:referrer_id, :referee_id]
    add_index :referrals, [:referee_id, :referrer_id]

    add_column :users, :referral_credit, :integer, default: 0
  end
end
