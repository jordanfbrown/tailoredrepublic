class OrdersController < ApplicationController
  before_filter :check_for_empty, :setup_order

  def new
    if user_signed_in? && current_user.stripe_customer_id?
      @stripe_customer = Stripe::Customer.retrieve current_user.stripe_customer_id
    end
  end

  def create
    card_token = params[:order][:stripe_card_token]

    # new user - create user, saved shipping/billing address, sign in, create stripe customer,
    # charge amount to stripe customer
    if params[:user]
      @user = User.new params[:user]
      @user.build_billing_address params[:billing_address]
      @user.build_shipping_address params[:shipping_address]

      unless @user.save
        return render action: 'new'
      end

      sign_in :user, @user

      #stripe_customer = create_stripe_customer @user, card_token, params[:user][:email]
      #charge_customer stripe_customer.id
    else
      # user with existing stripe customer id, just charge them
      if current_user.stripe_customer_id?
        charge_customer stripe_customer_id
      # user with no existing stripe customer id, create stripe customer, charge amount to stripe customer
      else
        stripe_customer = create_stripe_customer @user, card_token, current_user.email
        charge_customer stripe_customer.id
      end
    end
  end

  private
    def charge_customer(customer_id)
      Stripe::Charge.create(
        amount: @cart.total_price * 100,
        currency: 'usd',
        customer: customer_id
      )
    end

    def create_stripe_customer(user, card_token, email)
      stripe_customer = Stripe::Customer.create(
        card: card_token,
        email: email
      )
      user.stripe_customer_id = stripe_customer.id
      user.save
      stripe_customer
    end

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