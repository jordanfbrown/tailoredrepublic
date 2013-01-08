class Measurements < ActiveRecord::Base
  belongs_to :user
  attr_accessible :back, :bicep, :chest, :crotch, :cuff, :front, :hips, :length, :length, :neck, :shoulders, :sleeves, :stomach, :thigh, :waist, :wrist
end
