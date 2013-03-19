class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :rating
      t.string :summary
      t.string :status

      t.timestamps
    end

    add_index :reviews, :user_id
    add_index :reviews, :product_id
  end
end
