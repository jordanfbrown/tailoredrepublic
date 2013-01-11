class TR.Views.Order extends TR.Views.Base
  el: '#new-order'

  events:
    'submit #payment-form': 'submitPaymentForm'
    'click input[name=billing-same-as-shipping]': 'copyShippingToBilling'

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

  copyShippingToBilling: ->
    @$('#billing_address_line1').val @$('#shipping_address_line1').val()
    @$('#billing_address_line2').val @$('#shipping_address_line2').val()
    @$('#billing_address_city').val @$('#shipping_address_city').val()
    @$('#billing_address_state').val @$('#shipping_address_state').val()
    @$('#billing_address_zip').val @$('#shipping_address_zip').val()
