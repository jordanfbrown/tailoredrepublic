class AddLimitToReviewSummary < ActiveRecord::Migration
  def change
    change_column :reviews, :summary, :string, limit: 1000
  end
end
