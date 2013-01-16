class OrdersController < ApplicationController
  before_filter :ensure_cart_not_empty, :ensure_measurement_not_nil, except: :thank_you

  def new
    set_stripe_customer
    if request.post? && params[:user] && params[:billing_address] && params[:shipping_address]
      @user = User.new_from_params_and_measurement(params, @measurement)
      @order = Order.new_order(params, @user, @cart)
      @card_token = params[:stripe_card_token]
      @card_last4 = params[:card_last4]
      @card_exp_month = params[:card_exp_month]
      @card_exp_year = params[:card_exp_year]
      @password = params[:user][:password]
      @save_card_for_later = params[:save_card_for_later]
    else
      if user_signed_in?
        @user = current_user
        @order = @user.orders.build
        @order.build_address_from_address 'shipping', @user.shipping_address
        @order.build_address_from_address 'billing', @user.billing_address
      else
        @user = User.new
        @order = @user.orders.build
        @order.build_shipping_address
        @order.build_billing_address
      end
    end
  end

  def show
    if params[:id] == 'review'
      redirect_to new_order_path
    end
  end

  def review
    set_stripe_customer

    @card_token = params[:stripe_card_token]
    @card_last4 = @stripe_customer ? @stripe_customer[:active_card][:last4] : params[:card_last4]
    @card_exp_month = @stripe_customer ? @stripe_customer[:active_card][:exp_month].to_s : params[:card_exp_month]
    @card_exp_year = @stripe_customer ? @stripe_customer[:active_card][:exp_year].to_s : params[:card_exp_year]
    @save_card_for_later = params[:save_card_for_later]

    if params[:user]
      @user = User.new_from_params_and_measurement(params, @measurement)
      unless @user.valid?
        @order = Order.new
        # Need to populate the order so that the information isn't lost
        @order.build_billing_address params[:billing_address]
        @order.build_shipping_address params[:shipping_address]
        render action: "new" and return
      end
    else
      @user = current_user
    end

    @order = Order.new_order(params, @user, @cart)
    unless @order.valid?
      render action: "new"
    end
  end

  def create
    @card_token = params[:stripe_card_token]

    ActiveRecord::Base.transaction do
      if params[:user]
        @user = User.new_from_params_and_measurement(params, @measurement)
        unless @user.save
          render action: "review"
          raise ActiveRecord::Rollback and return
        end
        sign_in :user, @user
        charge_id = create_customer_or_charge_card @user
      else
        @user = current_user
        if @user.stripe_customer_id? && params[:use_saved_card]
          charge_id = @user.charge_customer @cart.total_price * 100
        else
          charge_id = create_customer_or_charge_card @user
        end
      end

      @order = Order.new_order(params, @user, @cart, charge_id)
      unless @order.save
        render action: "review"
        raise ActiveRecord::Rollback and return
      end
    end

    render 'thank_you'
  end

  def thank_you
    @order = Order.last
  end

  private
    def create_customer_or_charge_card(user)
      if params[:save_card_for_later]
        user.create_stripe_customer @card_token
        user.charge_customer @cart.total_price * 100
      else
        charge_card @card_token
      end
    end

    def charge_card(token)
      charge = Stripe::Charge.create(
        amount: @cart.total_price * 100,
        currency: 'usd',
        card: token,
        description: 'Single token charge'
      )
      charge[:id]
    end

    def ensure_cart_not_empty
      if @cart.empty?
        redirect_to shop_url
      end
    end

    def ensure_measurement_not_nil
      @measurement = user_signed_in? ? current_user.measurement : get_measurement_from_session
      if @measurement.nil?
        redirect_to measurements_path, notice: 'You need to enter your measurements before you can complete your order.'
      end
    end

    def set_stripe_customer
      if user_signed_in? && current_user.stripe_customer_id?
        @stripe_customer = current_user.get_stripe_customer
      end
    end
end