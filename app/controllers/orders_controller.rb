class OrdersController < ApplicationController
  before_filter :check_for_empty, :setup_order

  def new

  end

  def create
    card_token = params[:order][:stripe_card_token]

    # new user
    if params[:user]
      @user = User.new params[:user]

      unless @user.save
        return render action: 'new'
      end

      sign_in :user, @user

      stripe_customer = Stripe::Customer.create(
        card: card_token,
        description: 'Test user'
      )
      @user.stripe_customer_id = stripe_customer.id
      @user.save
    end

    # charge customer
    Stripe::Charge.create(
      amount: @cart.total_price,
      currency: 'usd',
      customer: card_token
    )
  end

  private
    def check_for_empty
      if @cart.empty?
        redirect_to shop_url
      end
    end

    def setup_order
      if user_signed_in?
        @user = current_user
        @order = @user.orders.build
        # TODO: Load in shipping/billing from the user
        @order.build_shipping_address
        @order.build_billing_address
      else
        @user = User.new
        @order = @user.orders.build
        @order.build_shipping_address
        @order.build_billing_address
      end
    end
end