class OrdersController < ApplicationController
  before_filter :setup_order

  def new
    if @cart.empty?
      redirect_to shop_url
    end
  end

  def create
    if @cart.empty?
      render action: 'new'
    else
      if params[:user]
        @user = User.create params[:user]
        if @user.errors
          render action: 'new'
        end
      end
      # create Stripe customer
      #customer = Stripe::Customer.create(
      #  card: token,
      #  description: 'Some user'
      #)

      ## charge customer
      #Stripe::Charge.create(
      #  amount: 1000, #cents
      #  currency: 'usd',
      #  customer: customer.id
      #)

      # charge card
      #Stripe::Charge.create(
      #  amount: 1000, #cents
      #  currency: 'usd',
      #  card: token,
      #  description: 'test charge'
      #)
    end
  end

  private
    def setup_order
      if user_signed_in?
        @user = current_user
        @order = @user.orders.build
        # TODO: Load in shipping/billing from the user
        @order.build_shipping_address
        @order.build_billing_address
      else
        @user = User.new
        @order = Order.new
        @order.build_shipping_address
        @order.build_billing_address
      end
    end
end