class ScheduleTailorRequest < ActiveRecord::Base
  before_create :set_status

  has_one :shipping_address, as: :addressable, validate: true

  attr_accessible :email, :ip_address, :status, :shipping_address_attributes

  accepts_nested_attributes_for :shipping_address

  validates_presence_of :email

  def self.filter_by_status(status, page)
    if status == 'all'
      self.paginate(page: page, per_page: 20, order: 'created_at DESC')
    else
      self.paginate(page: page, per_page: 20, order: 'created_at DESC', conditions: ['status = ?', status])
    end
  end

  def set_status
    self.status = 'new'
  end
end
