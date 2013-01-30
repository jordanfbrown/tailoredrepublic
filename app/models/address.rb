class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  attr_accessible :name, :city, :line1, :line2, :state, :zip, :phone_number, :type

  validates_presence_of :name, :city, :line1, :state, :zip
  validates :zip, format: { with: /^\d{5}(-\d{4})?$/, message: 'should be in the form 12345 or 12345-1234' }
  validates :phone_number, format: { with: /^[\(\)0-9\- \+\.]{10,20}$/, message: 'must be a valid telephone number' }

  def valid_with_phone?
    valid?
    if phone_number.blank?
      errors.add(:phone, 'is required')
    end
    errors.count == 0
  end
end
