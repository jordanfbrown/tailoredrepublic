class ChangeDateTimeToDateForCoupons < ActiveRecord::Migration
  def change
    change_column :coupons, :begin_date, :date
    change_column :coupons, :end_date, :date
  end
end
