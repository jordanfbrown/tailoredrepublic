class Review < ActiveRecord::Base
  STATUSES = %w(pending rejected accepted)

  belongs_to :user
  belongs_to :product
  attr_accessible :product_id, :rating, :status, :summary

  validates :status, inclusion: { in: STATUSES, message: "%{value} is not a valid status" }
  validates :summary, length: { minimum: 1, maximum: 1000 }

  scope :accepted, where('status = ?', 'accepted')

  def self.filter_by_status(status, page)
    if status == 'all'
      self.paginate(page: page, per_page: 20, order: 'created_at DESC')
    else
      self.paginate(page: page, per_page: 20, order: 'created_at DESC', conditions: ['status = ?', status])
    end
  end
end
