class TR.Views.EditUser extends TR.Views.Base
  el: '#edit-user'

  initialize: ->
    TR.setStripeKey()

  events:
    'submit': 'submitForm'

  submitForm: =>
    @$('.submit').attr 'disabled', 'disabled'

    cardNumber = @$('#card_number').val()
    unless cardNumber.indexOf('****-****-****') == 0 || cardNumber.length == 0
      Stripe.createToken
        number: $('#card_number').val()
        cvc: $('#card_code').val()
        exp_month: $('#card_month').val()
        exp_year: $('#card_year').val()
        name: $('#user_billing_address_attributes_name').val()
        address_line1: $('#user_billing_address_attributes_line1').val()
        address_line2: $('#user_billing_address_attributes_line2').val()
        address_city: $('#user_billing_address_attributes_city').val()
        address_state: $('#user_billing_address_attributes_state').val()
        address_zip: $('#user_billing_address_attributes_zip').val()
      , @stripeResponseHandler
      false

  stripeResponseHandler: (status, response) =>
    if response.error
      @$('.payment-errors').show().find('p').text response.error.message
      @$('.submit').removeAttr 'disabled'
    else
      @$('#stripe_card_token').val response.id
      @el.submit()


