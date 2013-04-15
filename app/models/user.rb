class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :measurement
  has_one :cart
  has_one :shipping_address, as: :addressable, validate: true
  has_one :billing_address, as: :addressable, validate: true
  has_many :referral_emails
  has_many :orders
  has_many :reviews
  has_many :referrals, class_name: 'Referral', foreign_key: 'referrer_id', dependent: :delete_all
  has_one :referred_by, class_name: 'Referral', foreign_key: 'referee_id', dependent: :delete

  attr_accessible :name, :email, :password, :remember_me, :sign_up_method
  attr_accessible :name, :email, :password, :remember_me, :shipping_address_attributes, :billing_address_attributes,
                  :measurement_attributes, :sign_up_method, as: :admin
  attr_protected :stripe_customer_id

  validates_presence_of :name

  accepts_nested_attributes_for :shipping_address, :billing_address, :measurement

  before_create :set_initial_role

  ROLES = %w(user admin)
  SIGN_UP_METHOD_ORDER = 'Order Page'
  SIGN_UP_METHOD_MEASUREMENTS = 'Measurements Page'
  SIGN_UP_METHOD_REGISTRATION = 'Registration Page'
  SIGN_UP_METHOD_SCRIPT = 'Automatic Script'

  def self.find_by_referral_code(code)
    find(code.split('-')[1])
  end

  def self.new_from_params_and_measurement(params, measurement)
    params[:user].merge!(params[:order])
    user = User.new(params[:user])
    user.measurement = measurement
    user
  end

  def referral_code
    first_name + '-' + id.to_s
  end

  def referral_url
    "https://www.tailoredrepublic.com/referrals/invite/#{referral_code}"
  end

  def add_referrer(referrer_id)
    referrer = User.find(referrer_id)
    unless referrer.nil?
      create_referred_by(referrer_id: referrer_id, status: Referral::STATUS_CREATED)
      self.referral_credit += Referral.credit_amount
      self.save
    end
  end

  def build_order(cart)
    order = orders.build
    shipping_address.blank? ? order.build_shipping_address : order.build_address_from_address(shipping_address)
    billing_address.blank? ? order.build_billing_address : order.build_address_from_address(billing_address)
    order.copy_line_items_from_cart(cart)
    order.referral_discount = referral_credit if order.should_apply_referral_discount?
    order
  end

  def get_stripe_customer
    Stripe::Customer.retrieve(stripe_customer_id)
  end

  def update_stripe_customer(card_token)
    stripe_customer = get_stripe_customer
    stripe_customer.card = card_token
    updated_customer = stripe_customer.save
    self.stripe_customer_id = updated_customer.id
    save!
  end

  def create_stripe_customer(card_token)
    if stripe_customer_id?
      update_stripe_customer(card_token)
    else
      stripe_customer = Stripe::Customer.create(
        card: card_token,
        email: email
      )
      self.stripe_customer_id = stripe_customer.id
      save!
    end
  end

  def charge_card(amount)
    Payments.charge_saved_card(amount, stripe_customer_id)
  end

  def save_address_if_address_nil(params)
    if shipping_address.blank? || billing_address.blank?
      update_attributes(params)
    else
      true
    end
  end

  def duplicate_measurement
    unless measurement.nil?
      duplicated_measurement = measurement.dup
      duplicated_measurement.user_id = nil
      duplicated_measurement
    end
  end

  def paginated_orders(page)
    Order.where(user_id: id).includes({line_items: [:product, :customization]}, :shipping_address, :billing_address,
                                      :measurement).paginate(page: page).order('created_at DESC')
  end

  def paginated_reviews(page)
    Review.where(user_id: id).includes(:product).paginate(page: page).order('created_at DESC')
  end

  def first_name
    name.split(' ')[0]
  end

  def update_with_password(params, *options)
    current_password = params.delete(:current_password)

    result = if valid_password?(current_password)
               update_attributes(params, *options)
             else
               self.assign_attributes(params, *options)
               self.valid?
               self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
               false
             end

    clean_up_passwords
    result
  end

  def admin?
    role == 'admin'
  end

  # A user can only review a product once
  def can_review_product?(product)
    find_review_by_product(product).nil?
  end

  def find_review_by_product(product)
    reviews.find_by_product_id(product.id)
  end

  def set_initial_role
    self.role = 'user'
  end
end
