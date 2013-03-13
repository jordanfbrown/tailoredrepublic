class Referral < ActiveRecord::Base
  attr_accessible :referee_id, :referrer_id, :status

  belongs_to :referrer, class_name: 'User'
  belongs_to :referee, class_name: 'User'

  def self.credit_amount
    20
  end
end
