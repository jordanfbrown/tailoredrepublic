class OrderObserver < ActiveRecord::Observer
  def after_save(order)
    OrderMailer.order_confirmation_email(order).deliver
  end
end
