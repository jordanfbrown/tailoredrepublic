class OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.build_shipping_address
    @order.build_billing_address
  end

  def create
    token = params[:stripe_token]

    ## create Stripe customer
    #customer = Stripe::Customer.create(
    #  card: token,
    #  description: 'Some user'
    #)
    #
    ## charge customer
    #Stripe::Charge.create(
    #  amount: 1000, #cents
    #  currency: 'usd',
    #  customer: customer.id
    #)

    # charge card
    Stripe::Charge.create(
      amount: 1000, #cents
      currency: 'usd',
      card: token,
      description: 'test charge'
    )
  end
end