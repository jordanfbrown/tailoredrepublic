class Referral < ActiveRecord::Base
  attr_accessible :referee_id, :referrer_id, :status

  belongs_to :referrer, class_name: 'User'
  belongs_to :referee, class_name: 'User'

  def self.credit_amount
    20
  end

  STATUS_CREATED = 'Account Created'
  STATUS_COMPLETED = 'Purchase Completed'

  def order_completed
    if status == STATUS_CREATED
      self.status = STATUS_COMPLETED
      save

      referrer.referral_credit += Referral.credit_amount
      referrer.save
    end
  end
end
