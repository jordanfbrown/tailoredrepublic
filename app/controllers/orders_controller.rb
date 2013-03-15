class OrdersController < ApplicationController
  before_filter :ensure_cart_not_empty, :ensure_measurement_not_nil, only: [:new, :review, :create]
  load_and_authorize_resource only: [:admin]

  def new
    set_stripe_customer
    if request.post?
      @user = current_user
      @order = Order.new_order(params[:order], @user, @cart)
      @card_token = params[:stripe_card_token]
      @card_last4 = params[:card_last4]
      @card_exp_month = params[:card_exp_month]
      @card_exp_year = params[:card_exp_year]
      @save_card_for_later = params[:save_card_for_later]
      @card_radio = params[:card_radio]
      @coupon_code = params[:coupon_code]
    else
      if user_signed_in?
        @user = current_user
        @order = @user.build_order(@cart)
        @card_radio = 'use_saved_card'
      else
        @user = User.new
        @order = @user.build_order(@cart)
      end
    end
  end

  def show
    if params[:id] == 'review'
      redirect_to new_order_path
    else
      @order = Order.find(params[:id])
      authorize! :show, @order
    end
  end

  def index
    if user_signed_in?
      @orders = current_user.paginated_orders(params[:page] ||= 1)
    else
      redirect_to root_path
    end
  end

  def admin
    params[:page] ||= 1
    if params[:search].blank?
      @orders = Order.paginated(params[:page])
    else
      @orders = Order.search(params[:search], params[:page])
    end
  end

  def review
    set_stripe_customer

    @card_token = params[:stripe_card_token]
    @card_last4 = @stripe_customer && params[:card_radio] == 'use_saved_card' ? @stripe_customer[:active_card][:last4] : params[:card_last4]
    @card_exp_month = @stripe_customer && params[:card_radio] == 'use_saved_card' ? @stripe_customer[:active_card][:exp_month].to_s : params[:card_exp_month]
    @card_exp_year = @stripe_customer && params[:card_radio] == 'use_saved_card' ? @stripe_customer[:active_card][:exp_year].to_s : params[:card_exp_year]
    @save_card_for_later = params[:save_card_for_later]
    @card_radio = params[:card_radio]
    @coupon_code = params[:coupon_code]

    if params[:user]
      @user = User.new_from_params_and_measurement(params, @measurement)
      unless @user.valid?
        @order = Order.new(params[:order])
        @order.copy_line_items_from_cart(@cart)
        render action: "new" and return
      end
    else
      @user = current_user
    end

    @order = Order.new_order(params[:order], @user, @cart)
    unless @order.valid?
      render action: "new" and return
    end

    unless @coupon_code.blank?
      @coupon = Coupon.find_by_code(@coupon_code)
      if @coupon.nil? || @coupon.invalid?
        @order.errors.add(:coupon, 'code invalid')
        render action: "new" and return
      else
        @order.coupon = @coupon
      end
    end

    if @user.new_record?
      @user.save
      add_referrer_if_referred_by(@user)
      sign_in :user, @user
    end

    @order.calculate_final_cost!
  end

  def create
    unless user_signed_in?
      redirect_to '/orders/new' and return
    end

    @card_token = params[:stripe_card_token]
    @coupon_code = params[:coupon_code]
    @user = current_user

    ActiveRecord::Base.transaction do
      unless @user.save_address_if_address_nil(params[:order])
        render action: "new"
        raise ActiveRecord::Rollback and return
      end

      # Create the order, copy user, user's measurements, and line items from cart, check for validity but don't save
      @order = Order.new_order(params[:order], @user, @cart)
      unless @order.valid?
        render action: "new"
        raise ActiveRecord::Rollback and return
      end

      # Apply coupon if coupon code has been entered
      unless @coupon_code.blank?
        @coupon = Coupon.find_by_code(@coupon_code)
        if @coupon.nil? || @coupon.invalid?
          @order.errors.add(:coupon, 'code invalid.')
          render action: "new" and return
        else
          @order.apply_coupon(@coupon)
        end
      end

      @order.calculate_final_cost!

      # Attempt to charge the credit card
      if @user.stripe_customer_id? && params[:card_radio] == 'use_saved_card'
        order_id = @user.charge_card(@order.final_cost)
      else
        order_id = create_customer_or_charge_card(@user, @card_token, @order.final_cost)
      end

      if order_id.is_a?(Hash)
        set_stripe_customer
        @order.errors[:base] << order_id[:message]
        render action: "new" and return
      else
        @order.order_id = order_id
      end

      if @order.has_gift_cards?
        Coupon.create_coupons_from_order(@order)
      end

      @order.save!
    end

    session[:account_created] = true if params[:user]
    session[:order_id] = @order.id
    redirect_to :thank_you_orders
  rescue Stripe::StripeError => e
    set_stripe_customer
    @order.errors[:base] << e.message
    render :new
  end

  def thank_you
    if session.has_key?('order_id')
      @order = Order.find(session[:order_id])
    else
      redirect_to '/shop/suits'
    end
  end

  private
    def create_customer_or_charge_card(user, token, final_cost)
      if params[:save_card_for_later] == 'on'
        user.create_stripe_customer(token)
        user.charge_card(final_cost)
      else
        Payments.charge_unsaved_card(final_cost, token)
      end
    end

    def ensure_cart_not_empty
      redirect_to '/shop/suits' if @cart.empty?
    end

    def ensure_measurement_not_nil
      unless @cart.skip_measurements?
        @measurement = user_signed_in? ? current_user.measurement : get_measurement_from_session
        if @measurement.nil?
          redirect_to measurements_path, notice: 'You need to enter your measurements before you can complete your order.'
        end
      end
    end

    def set_stripe_customer
      if user_signed_in? && current_user.stripe_customer_id?
        @stripe_customer = current_user.get_stripe_customer
      end
    end
end