class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  attr_accessible :name, :city, :line1, :line2, :state, :zip, :type

  validates_presence_of :name, :city, :line1, :state, :zip
  validates :zip, format: { with: /^\d{5}(-\d{4})?$/, message: 'should be in the form 12345 or 12345-1234' }
end
