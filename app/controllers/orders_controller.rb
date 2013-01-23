class OrdersController < ApplicationController
  before_filter :ensure_cart_not_empty, :ensure_measurement_not_nil, except: [:thank_you, :index]

  def new
    set_stripe_customer
    if request.post?
      @user = user_signed_in? ? current_user : User.new_from_params_and_measurement(params, @measurement)
      @order = Order.new_order(params[:order], @user, @cart)
      @card_token = params[:stripe_card_token]
      @card_last4 = params[:card_last4]
      @card_exp_month = params[:card_exp_month]
      @card_exp_year = params[:card_exp_year]
      @password = params[:user][:password] if params[:user]
      @save_card_for_later = params[:save_card_for_later]
    else
      if user_signed_in?
        @user = current_user
        @order = @user.build_order
      else
        @user = User.new
        @order = @user.build_order
      end
    end
  end

  def show
    if params[:id] == 'review'
      redirect_to new_order_path
    end
  end

  def index
    if !user_signed_in?
      redirect_to root_path
    else
      @orders = current_user.paginated_orders(params[:page] ||= 1)
    end
  end

  def review
    set_stripe_customer

    @card_token = params[:stripe_card_token]
    @card_last4 = @stripe_customer ? @stripe_customer[:active_card][:last4] : params[:card_last4]
    @card_exp_month = @stripe_customer ? @stripe_customer[:active_card][:exp_month].to_s : params[:card_exp_month]
    @card_exp_year = @stripe_customer ? @stripe_customer[:active_card][:exp_year].to_s : params[:card_exp_year]
    @save_card_for_later = params[:save_card_for_later]
    @use_saved_card = params[:use_saved_card]

    if params[:user]
      @user = User.new_from_params_and_measurement(params, @measurement)
      unless @user.valid?
        @order = Order.new(params[:order])
        render action: "new" and return
      end
    else
      @user = current_user
    end

    @order = Order.new_order(params[:order], @user, @cart)
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

        unless @user.save_address_if_address_nil(params[:order])
          render action: "review"
          raise ActiveRecord::Rollback and return
        end

        if @user.stripe_customer_id? && params[:use_saved_card] == 'on'
          charge_id = @user.charge_customer @cart.total_price * 100
        else
          charge_id = create_customer_or_charge_card @user
        end
      end

      @order = Order.new_order(params[:order], @user, @cart, charge_id)
      unless @order.save
        render action: "review"
        raise ActiveRecord::Rollback and return
      end
    end

    @cart.reload
    render 'thank_you'
  end

  # TODO: delete this before going live
  def thank_you
    @order = Order.last
  end

  private
    def create_customer_or_charge_card(user)
      if params[:save_card_for_later] == 'on'
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