class LineItemsController < ApplicationController
  def create
    product = Product.find(params[:product_id])

    if params[:customization_id]
      customization = Customization.find(params[:customization_id])
      line_item = @cart.line_items.build(product: product, customization: customization, quantity: 1)
    else
      line_item = @cart.line_items.build(product: product, quantity: 1)
    end

    if line_item.save
      render json: line_item
    else
      render json: line_item.errors
    end
  end

  def update
    @line_item = @cart.line_items.find(params[:id])

    if @line_item.update_attributes(params[:line_item])
      head :no_content
    else
      render json: @line_item.errors, status: :unprocessable_entity
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