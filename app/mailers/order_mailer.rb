class OrderMailer < ActionMailer::Base
  helper :carts
  default from: "no-reply@tailoredrepublic.com"

  def order_confirmation_email(order)
    @order = order
    @user = order.user
    mail(to: @user.email, subject: "Tailored Republic Order Confirmation (#{order.stripe_charge_id})")
    mail(to: 'orders@tailoredrepublic.com', subject: "New Order (#{order.stripe_charge_id})")
  end
end
