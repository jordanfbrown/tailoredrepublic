class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  attr_accessible :name, :city, :line1, :line2, :state, :zip, :phone_number, :type
  attr_accessible :name, :city, :line1, :line2, :state, :zip, :phone_number, :type, as: :admin

  validates_presence_of :name, :city, :line1, :state, :zip
  validates :zip, format: { with: /^\d{5}(-\d{4})?$/, message: 'should be in the form 12345 or 12345-1234' }

  def validate_phone_or_email(email)
    valid?
    if phone_number.blank? && email.blank?
      errors.add(:base, 'At least one form of contact must be entered: email or phone number')
    end
    errors.count == 0
  end
end
