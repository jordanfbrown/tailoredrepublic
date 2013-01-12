class TR.Views.Order extends TR.Views.Base
  el: '#new-order'

  events:
    'submit form#new_order': 'submitOrder'
    'click input[name=billing-same-as-shipping]': 'copyShippingToBilling'

  initialize: ->
    Stripe.setPublishableKey $('meta[name=stripe-key]').attr 'content'

  submitOrder: (e) ->
    if @validateForm()
      @$('.submit-button').attr 'disabled', 'disabled'

#      Stripe.createToken
#        number: @$('#card_number').val()
#        cvc: @$('#card_code').val()
#        exp_month: @$('#card_month').val()
#        exp_year: @$('#card_year').val()
#        name: @$('#billing_address_name').val()
#        address_line1: @$('#billing_address_line1').val()
#        address_line2: @$('#billing_address_line2').val()
#        address_city: @$('#billing_address_city').val()
#        address_state: @$('#billing_address_state').val()
#        address_zip: @$('#billing_address_zip').val()
#      , @stripeResponseHandler

      @stripeResponseHandler(true, {id: 1})
    false
  
  stripeResponseHandler: (status, response) =>
    if response.errors
      @$('.payment-errors').show().find('p').text response.error.message
      @$('.submit-button').removeAttr 'disabled'
    else
      @$('#order_stripe_card_token').val response.id
      @$('form')[0].submit()

  copyShippingToBilling: ->
    @$('#billing_address_name').val @$('#shipping_address_name').val()
    @$('#billing_address_line1').val @$('#shipping_address_line1').val()
    @$('#billing_address_line2').val @$('#shipping_address_line2').val()
    @$('#billing_address_city').val @$('#shipping_address_city').val()
    @$('#billing_address_state').val @$('#shipping_address_state').val()
    @$('#billing_address_zip').val @$('#shipping_address_zip').val()

  setError: ($input, message) ->
    $input.addClass 'error'

    if $input.next('.error').exists()
      $input.next('.error').text message
    else
      $('<small class="error">' + message + '</small>').insertAfter $input

  removeError: ($input) ->
    $input.removeClass('error').next('.error').fadeOut()

  validateForm: ->
    valid = true

#    if Stripe.validateCardNumber @$('#card-number').val()
#      @removeError @$('#card-number')
#    else
#      @setError @$('#card_number'), 'Invalid credit card number.'
#      valid = false
#
#    if Stripe.validateCVC @$('#card_code').val()
#      @removeError @$('#card_code')
#    else
#      @setError @$('#card_code'), 'Invalid security code.'
#      valid = false

    nonEmptyFields = [
      '#shipping_address_name'
      '#shipping_address_line1'
      '#shipping_address_city'
      '#shipping_address_zip'
      '#billing_address_name'
      '#billing_address_line1'
      '#billing_address_city'
      '#billing_address_zip'
    ]

    @$(nonEmptyFields.join(', ')).each (index, el) =>
      if $(el).val().trim() == ''
        @setError $(el), 'This field cannot be left blank.'
        valid = false
        null
      else
        @removeError $(el)

    valid


