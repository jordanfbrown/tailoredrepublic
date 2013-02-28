class TapeMeasureRequest < ActiveRecord::Base
  before_create :set_sent_to_false
  has_one :shipping_address, as: :addressable, validate: true

  attr_accessible :email, :ip_address, :sent, :shipping_address_attributes

  validates_presence_of :email

  accepts_nested_attributes_for :shipping_address

  def self.filter_by_status(status, page)
    if status == 'all'
      self.paginate(page: page, per_page: 20, order: 'created_at DESC')
    elsif status == 'sent'
      self.paginate(page: page, per_page: 20, order: 'created_at DESC', conditions: ['sent = ?', true])
    elsif status == 'unsent'
      self.paginate(page: page, per_page: 20, order: 'created_at DESC', conditions: ['sent = ?', false])
    end
  end

  def set_sent_to_false
    self.sent = false
    true
  end
end
