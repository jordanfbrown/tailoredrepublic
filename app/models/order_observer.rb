class OrderObserver < ActiveRecord::Observer
  def after_create(order)
    OrderMailer.order_confirmation_email(order).deliver
    OrderMailer.order_fulfillment_email(order).deliver

    unless order.coupon.nil?
      order.update_coupon_amount
    end

    unless order.referral_discount.nil?
      user = order.user
      user.referral_credit = 0
      user.save

      referral = user.referred_by
      referral.order_completed
    end
  end
end
