class ScheduleTailorRequest < ActiveRecord::Base
  before_create :set_status

  attr_accessible :email, :ip_address, :name, :zip, :phone, :status
  validates_presence_of :email, :name, :zip
  validates :status, inclusion: { in: %w(new scheduled),
    message: "%{value} is not a valid status -- options are new or scheduled" }, allow_nil: true

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
