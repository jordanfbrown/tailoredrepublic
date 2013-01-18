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
    params[:user].merge! params[:order]
    user = User.new params[:user]
    user.measurement = measurement
    user
  end

  def build_order
    order = orders.build
    shipping_address.blank? ? order.build_shipping_address : order.build_address_from_address(shipping_address)
    billing_address.blank? ? order.build_billing_address : order.build_address_from_address(billing_address)
    order
  end

  def get_stripe_customer
    Stripe::Customer.retrieve stripe_customer_id
  end

  def update_stripe_customer(card_token)
    stripe_customer = get_stripe_customer
    stripe_customer.card = card_token
    #stripe_customer.address_line1 = billing_address.line1
    #stripe_customer.address_line2 = billing_address.line2
    #stripe_customer.address_city = billing_address.city
    #stripe_customer.address_state = billing_address.state
    #stripe_customer.address_zip = billing_address.zip
    new_customer = stripe_customer.save
    self.stripe_customer_id = new_customer.id
    save
  end

  def create_stripe_customer(card_token)
    stripe_customer = Stripe::Customer.create(
      card: card_token,
      email: email
    )
    self.stripe_customer_id = stripe_customer.id
    save
  end

  def charge_customer(amount)
    charge = Stripe::Charge.create(
      amount: amount,
      currency: 'usd',
      customer: stripe_customer_id,
      description: 'Customer charge'
    )
    charge[:id]
  end
end
