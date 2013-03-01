class OrdersController < ApplicationController
  before_filter :ensure_cart_not_empty, :ensure_measurement_not_nil, except: [:thank_you, :index, :show, :admin]

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
    if user_signed_in? && current_user.role == 'admin'
      params[:page] ||= 1
      if params[:search].blank?
        @orders = Order.paginated(params[:page])
      else
        @orders = Order.search(params[:search], params[:page])
      end
    else
      redirect_to root_path
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
        @order.errors.add(:coupon, 'code invalid.')
        render action: "new" and return
      else
        @order.coupon = @coupon
      end
    end

    @order.apply_tax
  end

  def thank_you
    render_404
  end

  def create
    @card_token = params[:stripe_card_token]
    @coupon_code = params[:coupon_code]

    ActiveRecord::Base.transaction do
      # Create a new user and sign them in, or get the current_user if already signed in
      if params[:user]
        @user = User.new_from_params_and_measurement(params, @measurement)
        unless @user.save
          render action: "new"
          raise ActiveRecord::Rollback and return
        end
        sign_in :user, @user
      else
        @user = current_user
        unless @user.save_address_if_address_nil(params[:order])
          render action: "new"
          raise ActiveRecord::Rollback and return
        end
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

      @order.apply_tax

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

    # Need to reload the cart because its line items have been copied to the order
    @cart.reload
    render 'thank_you'
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
      if @cart.empty?
        redirect_to shop_url
      end
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