require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test 'order confirmation email' do
    order = orders(:shirt_order)

    email = OrderMailer.order_confirmation_email(order).deliver
    assert !ActionMailer::Base.deliveries.empty?

    assert_equal [order.user.email], email.to
    assert_equal 'Tailored Republic Order Confirmation ()', email.subject
  end
end
