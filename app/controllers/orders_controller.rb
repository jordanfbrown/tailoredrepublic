class OrdersController < ApplicationController
  before_filter :check_for_empty, :setup_order

  def new
    if user_signed_in? && current_user.stripe_customer_id?
      @stripe_customer = current_user.get_stripe_customer
    end
  end

  def create
    @card_token = params[:order][:stripe_card_token]

    ActiveRecord::Base.transaction do
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
        create_customer_or_charge_card
      else
        if current_user.stripe_customer_id?
          current_user.charge_customer @cart.total_price * 100
        else
          create_customer_or_charge_card
        end
      end

      # Create order
      @order = Order.new
      @order.build_billing_address params[:billing_address]
      @order.build_shipping_address params[:shipping_address]
      @order.user = current_user
      @order.stripe_card_token = params[:save_card_for_later] ? @stripe_customer.id : @card_token
      @order.copy_line_items_from_cart @cart
      @order.save
    end
  end

  private
    def create_customer_or_charge_card
      if params[:save_card_for_later]
        current_user.create_stripe_customer @card_token
        current_user.charge_customer @cart.total_price * 100
      else
        charge_card @card_token
      end
    end

    def charge_card(token)
      Stripe::Charge.create(
        amount: @cart.total_price * 100,
        currency: 'usd',
        card: token,
        description: 'Single token charge'
      )
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