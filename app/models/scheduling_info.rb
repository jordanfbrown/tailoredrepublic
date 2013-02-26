class SchedulingInfo
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :email, :zip_code, :phone_number, :subscribe_to_mailing_list

  validates_presence_of :name, :email, :zip_code
  validates :zip_code, format: { with: /^\d{5}(-\d{4})?$/, message: 'should be in the form 12345 or 12345-1234' }

  def persisted?
    false
  end

  def initialize(name, email, zip_code, phone_number, subscribe_to_mailing_list)
    @name, @email, @zip_code, @phone_number, @subscribe_to_mailing_list = name, email, zip_code, phone_number, subscribe_to_mailing_list
  end
end