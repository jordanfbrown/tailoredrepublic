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
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  attr_protected :stripe_customer_id

  def get_stripe_customer
    Stripe::Customer.retrieve stripe_customer_id
  end

  def create_stripe_customer(card_token)
    stripe_customer = Stripe::Customer.create(
        card: card_token,
        email: email
    )
    self.stripe_customer_id = stripe_customer.id
    save
    stripe_customer
  end

  def charge_customer(amount)
    Stripe::Charge.create(
      amount: amount,
      currency: 'usd',
      customer: stripe_customer_id,
      description: 'Customer charge'
    )
  end
end
