class Payments
  def self.charge_unsaved_card(amount, token)
    amount = (amount * 100).to_i
    if amount >= 50
      charge = Stripe::Charge.create(
        amount: amount,
        currency: 'usd',
        card: token,
        description: 'Single token charge'
      )
      charge[:id]
    else
      Order.generate_id
    end
  rescue Stripe::StripeError => e
    { error: true, message: e.message }
  end

  def self.charge_saved_card(amount, customer_id)
    amount = (amount * 100).to_i
    if amount >= 50
      charge = Stripe::Charge.create(
          amount: amount,
          currency: 'usd',
          customer: customer_id,
          description: 'Customer charge'
      )
      charge[:id]
    else
      Order.generate_id
    end
  rescue Stripe::StripeError => e
    { error: true, message: e.message }
  end
end