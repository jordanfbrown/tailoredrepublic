class TR.Views.Order extends TR.Views.Base
  el: '#new-order'

  events:
    'submit #payment-form': 'submitPaymentForm'

  initialize: ->
    Stripe.setPublishableKey $('meta[name=stripe-key]').attr 'content'

  submitPaymentForm: (e) ->
    @$('.submit-button').attr 'disabled', 'disabled'
  
    Stripe.createToken
      number: @$('.card-number').val()
      cvc: @$('.card-cvc').val()
      exp_month: @$('.card-expiry-month').val()
      exp_year: @$('.card-expiry-year').val()
    , @stripeResponseHandler

    false
  
  stripeResponseHandler: (status, response) ->
    if response.errors
      @$('.payment-errors').text response.error.message
      @$('.submit-button').removeAttr 'disabled'
    else
      token = response.id
      console.log(token);

