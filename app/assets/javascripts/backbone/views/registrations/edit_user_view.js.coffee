class TR.Views.EditUser extends TR.Views.Base
  el: '#edit_user'

  initialize: ->
    TR.setStripeKey()

  events:
    'submit': 'submitForm'
    
  submitForm: =>
    @$('.submit').attr 'disabled', 'disabled'

    cardNumber = @$('#card_number').val()
    unless cardNumber.indexOf('****-****-****') == 0 || cardNumber.length == 0
      TR.createStripeToken @stripeResponseHandler
      false

  stripeResponseHandler: (status, response) =>
    if response.error
      @$('.payment-errors').show().find('p').text response.error.message
      @$('.submit').removeAttr 'disabled'
    else
      @$('#stripe_card_token').val response.id
      @el.submit()


