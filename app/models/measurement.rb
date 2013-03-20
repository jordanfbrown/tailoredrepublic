class Measurement < ActiveRecord::Base
  belongs_to :user
  belongs_to :order
  attr_accessible :arm_length, :back, :bicep, :chest, :crotch, :full_shoulders, :hips, :jacket_length, :neck,
                  :pant_length, :stomach, :thigh, :waist, :wrist, :age, :weight, :height
  attr_accessible :arm_length, :back, :bicep, :chest, :crotch, :full_shoulders, :hips, :jacket_length, :neck,
                  :pant_length, :stomach, :thigh, :waist, :wrist, :age, :weight, :height, as: :admin


  validates :arm_length, :back, :bicep, :chest, :full_shoulders, :hips, :jacket_length, :neck, :stomach, :waist,
            :wrist, numericality: { greater_than: 0, less_than: 90, message: 'must be a number between 0 and 90' }
  validates :crotch, :pant_length, :thigh, numericality: { greater_than: 0, less_than: 90, message: 'must be a number between 0 and 90' }, allow_nil: true
  validates :age, numericality: { greater_than: 0, less_than: 110, message: 'must be a number between 0 and 110'}
  validates :weight, numericality: { greater_than: 0, less_than: 400, message: 'must be a number between 0 and 400'}
  validates :height, numericality: { greater_than: 0, less_than: 96, message: 'must be a number between 0 and 96'}

  def display_attributes
    attributes.except('id', 'created_at', 'updated_at', 'user_id', 'order_id')
  end

  def self.num_measurements(only_shirts)
    only_shirts ? 11: 14
  end
end
