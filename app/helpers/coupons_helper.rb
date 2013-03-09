module CouponsHelper
  def apply_to_type(coupon)
    if coupon.apply_to_type == 'product'
      "Product (#{coupon.apply_to_product.name})"
    elsif coupon.apply_to_type == 'order'
      "Order"
    else
      "#{coupon.apply_to_type.capitalize} (#{coupon.apply_to_group})"
    end
  end
end
