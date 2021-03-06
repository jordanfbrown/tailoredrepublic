class OrderMailer < ActionMailer::Base
  include ActionView::Helpers::NumberHelper
  helper :carts
  default from: '"Tailored Republic" <orders@tailoredrepublic.com>'

  def order_confirmation_email(order)
    @order = order
    @user = order.user

    if Rails.env.development?
      mail to: 'jordan@tailoredrepublic.com', subject: "Tailored Republic Order Confirmation (#{order.order_id})"
    else
      mail to: @user.email, bcc: 'orders@tailoredrepublic.com',
           subject: "Tailored Republic Order Confirmation (#{order.order_id})"
    end
  end

  def order_fulfillment_email(order)
    @order = order
    to = Rails.env == 'development' ? 'jordan@tailoredrepublic.com' :
      'jordan@tailoredrepublic.com, jeff@tailoredrepublic.com, brian@tailoredrepublic.com'
    attachments["order_#{order.order_id}.csv"] = order.to_csv
    mail to: to, subject: "New Order (#{order.order_id}) (#{Rails.env})"
  end
end
