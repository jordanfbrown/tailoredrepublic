class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  attr_accessible :city, :line1, :line2, :state, :zip, :type

  validates :zip, format: { with: /^\d{5}(-\d{4})?$/, message: 'Zip should be in the form 12345 or 12345-1234' }
end
