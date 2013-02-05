class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :measurement
  has_one :shipping_address, as: :addressable, validate: true
  has_one :billing_address, as: :addressable, validate: true
  has_many :orders

  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :shipping_address, :billing_address
  attr_protected :stripe_customer_id

  validates_presence_of :name

  accepts_nested_attributes_for :shipping_address, :billing_address

  def self.new_from_params_and_measurement(params, measurement)
    params[:user].merge!(params[:order])
    user = User.new(params[:user])
    user.measurement = measurement
    user
  end

  def build_order(cart)
    order = orders.build
    shipping_address.blank? ? order.build_shipping_address : order.build_address_from_address(shipping_address)
    billing_address.blank? ? order.build_billing_address : order.build_address_from_address(billing_address)
    order.copy_line_items_from_cart(cart)
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
    duplicated_measurement = measurement.dup
    duplicated_measurement.user_id = nil
    duplicated_measurement
  end

  def paginated_orders(page)
    Order.where(user_id: id).includes({line_items: [:product, :customization]}, :shipping_address, :billing_address,
                                      :measurement).paginate(page: page).order('created_at DESC')
  end
end
