class Measurement < ActiveRecord::Base
  belongs_to :user
  belongs_to :order
  attr_accessible :arm_length, :back, :bicep, :chest, :crotch, :front, :full_shoulders, :hips, :jacket_length, :neck,
                  :pant_length, :stomach, :thigh, :waist, :wrist

  validates :arm_length, :back, :bicep, :chest, :front, :full_shoulders, :hips, :jacket_length, :neck, :stomach, :waist,
            :wrist, numericality: { greater_than: 0, less_than: 90, message: 'must be a number between 0 and 90' }
  validates :crotch, :pant_length, :thigh, numericality: { greater_than: 0, less_than: 90, message: 'must be a number between 0 and 90' }, allow_nil: true
end
