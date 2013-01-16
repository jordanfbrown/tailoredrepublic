module UsersHelper
  def card_number
    if @stripe_customer
      'XXXX-XXXX-XXXX-' + @stripe_customer[:active_card][:last4]
    elsif @card_last4
      'XXXX-XXXX-XXXX-' + @card_last4
    else
      ''
    end
  end

  def card_code
    @stripe_customer || @card_token ? 'XXX' : ''
  end

  def card_month
    @stripe_customer ? @stripe_customer[:active_card][:exp_month] : @card_month
  end

  def card_year
    @stripe_customer ? @stripe_customer[:active_card][:exp_year] : @card_year
  end
end