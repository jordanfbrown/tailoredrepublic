module HomeHelper
  def shop_or_cart
    @item_count > 0 ? 'cart' : 'shop'
  end
end
