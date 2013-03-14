require 'test_helper'

class ReferralEmailTest < ActiveSupport::TestCase
  test "validations for a list of email addresses should work correctly" do
    assert ReferralEmail.new(email_addresses: 'jordan@tailoredrepublic.com').valid?
    assert ReferralEmail.new(email_addresses: 'jordan@tailoredrepublic.com,bob@tailoredrepublic.com').valid?
    assert ReferralEmail.new(email_addresses: 'jordan@tailoredrepublic.com, bob@tailoredrepublic.com').valid?
    assert ReferralEmail.new(email_addresses: 'jordan@tailoredrepublic.com, bob@tailoredrepublic.com, jim@tailoredrepublic.com').valid?
    assert ReferralEmail.new(email_addresses: 'jordan@tailoredrepublic.com, bob@tailoredrepublic.com,jim@tailoredrepublic.com').valid?
    assert !ReferralEmail.new(email_addresses: 'jordan@tailoredrepublic.com, sdf').valid?
    assert !ReferralEmail.new(email_addresses: 'sdfsdf').valid?
  end
end
