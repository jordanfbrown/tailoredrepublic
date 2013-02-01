class OrderObserver < ActiveRecord::Observer
  def after_create(order)
    OrderMailer.order_confirmation_email(order).deliver

    unless order.coupon.nil?
      order.coupon.update_amount!(order)
    end
  end
end
