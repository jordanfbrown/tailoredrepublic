class ReferralEmail < ActiveRecord::Base
  belongs_to :user

  attr_accessible :email_addresses, :message
  validates_presence_of :email_addresses

  after_create :send_email

  before_validation do
    email_addresses = self.email_addresses.split(/,/).map(&:strip)

    email_addresses.each do |email_address|
      self.errors.add(:email_addresses, "invalid") unless email_address =~ /([^\s]+)@([^\s]+)/
    end

    self.email_addresses = email_addresses.join(',')
  end

  def send_email
    ReferralsMailer.invite_friends_email(user, email_addresses, message).deliver
  end
end
