class CartItemsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    customization = Customization.find(params[:customization_id])
    cart_item = @cart.cart_items.build(product: product, customization: customization)

    if cart_item.save
      render json: cart_item
    else
      render json: cart_item.errors
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])

    if cart_item.cart == @cart
      cart_item.destroy
      render json: {success: true}
    else
      render json: {error: 'Unauthorized'}, status: 403
    end
  end
end