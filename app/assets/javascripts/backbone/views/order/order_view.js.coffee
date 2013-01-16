class TR.Views.Order extends TR.Views.Base
  el: '#new-order'

  events:
    'submit form#new_order': 'submitOrder'
    'click input[name=billing-same-as-shipping]': 'copyShippingToBilling'
    'keyup #user_name': 'copyUserNameToShippingName'
    'click input[name=use_saved_card]': 'toggleSavedCreditCard'

  initialize: (options) ->
    @cardInfo = options.cardInfo || false
    TR.setStripeKey()

  submitOrder: (e) ->
    if @validateForm()
      @$('.submit-button').attr 'disabled', 'disabled'

      # If we're using a saved card, then we don't need to create a one time payment token -- we can just submit the
      # form and charge the existing customer
      if @$('input[name=use_saved_card]').is ':checked'
        true
      else if @$('#stripe_card_token').val().length > 0
        true
      else
        TR.createStripeToken @stripeResponseHandler
        false
  
  stripeResponseHandler: (status, response) =>
    if response.error
      @$('.payment-errors').show().find('p').text response.error.message
      @$('.submit-button').removeAttr 'disabled'
    else
      @$('#stripe_card_token').val response.id
      @$('#card_last4').val response.card.last4
      @$('#card_exp_month').val response.card.exp_month
      @$('#card_exp_year').val response.card.exp_year
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

  toggleSavedCreditCard: (e) ->
    if $(e.currentTarget).is ':checked'
      @$('#card_number').val "XXXX-XXXX-XXXX-#{@cardInfo.last4}"
      @$('#card_code').val "XXX"
      @$('#card_month').val @cardInfo.exp_month
      @$('#card_year').val @cardInfo.exp_year
    else
      @$('#card_number').val ''
      @$('#card_code').val ''
      @$('#card_month').val ''
      @$('#card_year').val ''

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


