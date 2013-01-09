class Measurement < ActiveRecord::Base
  belongs_to :user
  attr_accessible :arm_length, :back, :bicep, :chest, :crotch, :front, :full_shoulders, :hips, :jacket_length, :neck, :pant_length, :stomach, :thigh, :waist, :wrist
end
