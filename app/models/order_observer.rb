class OrderObserver < ActiveRecord::Observer
  def after_create(order)
    OrderMailer.order_confirmation_email(order).deliver

    unless order.coupon.nil?
      order.update_coupon_amount
    end
  end
end
