class OrderMailer < ActionMailer::Base
  default from: "no-reply@tailoredrepublic.com"

  def order_confirmation_email(order)
    @order = order
    @user = order.user
    mail(to: @user.email, subject: 'Tailored Republic Order Confirmation')
  end
end
