class LineItemsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    customization = Customization.find(params[:customization_id])
    line_item = @cart.line_items.build(product: product, customization: customization)

    if line_item.save
      render json: line_item
    else
      render json: line_item.errors
    end
  end

  def destroy
    line_item = LineItem.find(params[:id])

    if line_item.cart == @cart
      line_item.destroy
      render json: {success: true}
    else
      render json: {error: 'Unauthorized'}, status: 403
    end
  end
end