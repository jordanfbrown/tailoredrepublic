class OrderMailer < ActionMailer::Base
  include ActionView::Helpers::NumberHelper
  helper :carts
  default from: "no-reply@tailoredrepublic.com"

  def order_confirmation_email(order)
    @order = order
    @user = order.user
    mail(to: @user.email, bcc: 'orders@tailoredrepublic.com', subject: "Tailored Republic Order Confirmation (#{order.stripe_charge_id})")
  end
end
