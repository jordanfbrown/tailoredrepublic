class OrderMailer < ActionMailer::Base
  include ActionView::Helpers::NumberHelper
  helper :carts
  default from: "orders@tailoredrepublic.com"

  def order_confirmation_email(order)
    @order = order
    @user = order.user
    mail(
      to: @user.email,
      bcc: 'orders@tailoredrepublic.com',
      subject: "Tailored Republic Order Confirmation (#{order.order_id})",
    )
  end

  def order_fulfillment_email(order)
    @order = order
    mail(
      to: 'jordan@tailoredrepublic.com, jeff@tailoredrepublic.com, brian@tailoredrepublic.com',
      subject: "New Order (#{order.order_id})"
    )
  end
end
