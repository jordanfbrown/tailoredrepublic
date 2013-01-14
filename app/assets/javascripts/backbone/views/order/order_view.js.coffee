class TR.Views.Order extends TR.Views.Base
  el: '#new-order'

  events:
    'submit form#new_order': 'submitOrder'
    'click input[name=billing-same-as-shipping]': 'copyShippingToBilling'
    'keyup #user_name': 'copyUserNameToShippingName'

  initialize: ->
    Stripe.setPublishableKey $('meta[name=stripe-key]').attr 'content'

  submitOrder: (e) ->
    if @validateForm()
      @$('.submit-button').attr 'disabled', 'disabled'


      # If we're using a saved card, then we don't need to create a one time payment token -- we can just submit the
      # form and charge the existing customer
      if @$('input[name=use_saved_card]').is ':checked'
        true
      else
        Stripe.createToken
          number: @$('#card_number').val()
          cvc: @$('#card_code').val()
          exp_month: @$('#card_month').val()
          exp_year: @$('#card_year').val()
          name: @$('#billing_address_name').val()
          address_line1: @$('#billing_address_line1').val()
          address_line2: @$('#billing_address_line2').val()
          address_city: @$('#billing_address_city').val()
          address_state: @$('#billing_address_state').val()
          address_zip: @$('#billing_address_zip').val()
        , @stripeResponseHandler
        false
  
  stripeResponseHandler: (status, response) =>
    if response.errors
      @$('.payment-errors').show().find('p').text response.error.message
      @$('.submit-button').removeAttr 'disabled'
    else
      @$('#order_stripe_card_token').val response.id
      @$('form')[0].submit()

  copyShippingToBilling: ->
    for field in ['name', 'line1', 'line2', 'city', 'state', 'zip']
      @$("#billing_address_#{field}").val @$("#shipping_address_#{field}").val()

  setError: ($input, message) ->
    $input.addClass 'error'

    if $input.next('.error').exists()
      $input.next('.error').text message
    else
      $('<small class="error">' + message + '</small>').insertAfter $input

  removeError: ($input) ->
    $input.removeClass('error').next('.error').fadeOut()

  copyUserNameToShippingName: (e) ->
    @$('#shipping_address_name').val $(e.currentTarget).val()

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


