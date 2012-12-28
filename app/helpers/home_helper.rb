module HomeHelper
  def shop_or_cart
    @cart.empty? ? 'shop': 'cart'
  end
end
