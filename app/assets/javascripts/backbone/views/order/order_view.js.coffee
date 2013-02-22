class TR.Views.Order extends TR.Views.Base
  el: '#new-order'

  events:
    'submit form#new_order': 'submitOrder'
    'click input[name=billing-same-as-shipping]': 'copyShippingToBilling'
    'keyup #user_name': 'copyUserNameToShippingName'
    'click input[name=use_saved_card]': 'toggleSavedCreditCard'
    'change #card_month, #card_year, #card_number, #card_code': 'changedCreditCard'

  initialize: (options) ->
    @cardInfo = options.cardInfo || false
    TR.setStripeKey()
    @$('#user_password').showPassword()

  submitOrder: (e) ->
    if @validateForm()
      @$('.submit-button').attr 'disabled', 'disabled'

      # If we're using a saved card, then we don't need to create a one time payment token -- we can just submit the
      # form and charge the existing customer
      if @$('input[name=card_radio]:checked').val() == 'use_saved_card'
        true
      else
        Stripe.createToken
          number: $('#card_number').val()
          cvc: $('#card_code').val()
          exp_month: $('#card_month').val()
          exp_year: $('#card_year').val()
          name: $('#order_billing_address_attributes_name').val()
          address_line1: $('#order_billing_address_attributes_line1').val()
          address_line2: $('#order_billing_address_attributes_line2').val()
          address_city: $('#order_billing_address_attributes_city').val()
          address_state: $('#order_billing_address_attributes_state').val()
          address_zip: $('#order_billing_address_attributes_zip').val()
        , @stripeResponseHandler
        false
    else
      false
  
  stripeResponseHandler: (status, response) =>
    if response.error
      @$('.payment-errors').show().find('p').text response.error.message
      @$('.submit-button').removeAttr 'disabled'
      @$('.payment-errors').smoothScroll -30, 500
    else
      @$('#stripe_card_token').val response.id
      @$('#card_last4').val response.card.last4
      @$('#card_exp_month').val response.card.exp_month
      @$('#card_exp_year').val response.card.exp_year
      @$('form')[0].submit()

  copyShippingToBilling: ->
    for field in ['name', 'line1', 'line2', 'city', 'state', 'zip']
      @$("#order_billing_address_attributes_#{field}").val @$("#order_shipping_address_attributes_#{field}").val()

  copyUserNameToShippingName: (e) ->
    @$('#order_shipping_address_attributes_name').val $(e.currentTarget).val()

  toggleSavedCreditCard: (e) ->
    if $(e.currentTarget).is ':checked'
      @$('#card_number').val "****-****-****-#{@cardInfo.last4}"
      @$('#card_code').val "***"
      @$('#card_month').val @cardInfo.exp_month
      @$('#card_year').val @cardInfo.exp_year
    else
      @$('#card_number').val ''
      @$('#card_code').val ''
      @$('#card_month').val ''
      @$('#card_year').val ''
      
  changedCreditCard: (e) ->
    $useSavedCard = $('input[name=use_saved_card]')
    if $useSavedCard.is ':checked'
      $useSavedCard.removeAttr 'checked'

  validateForm: ->
    valid = true

    # TODO: uncomment these once we go live
#    if Stripe.validateCardNumber @$('#card-number').val()
#      TR.UI.removeError @$('#card-number')
#    else
#      TR.UI.setError @$('#card_number'), 'Invalid credit card number.'
#      valid = false
#
#    if Stripe.validateCVC @$('#card_code').val()
#      TR.UI.removeError @$('#card_code')
#    else
#      TR.UI.setError @$('#card_code'), 'Invalid security code.'
#      valid = false

    nonEmptyFields = [
      '#order_shipping_address_attributes_name'
      '#order_shipping_address_attributes_line1'
      '#order_shipping_address_attributes_city'
      '#order_shipping_address_attributes_zip'
      '#order_billing_address_attributes_name'
      '#order_billing_address_attributes_line1'
      '#order_billing_address_attributes_city'
      '#order_billing_address_attributes_zip'
    ]

    $first = false
    @$(nonEmptyFields.join(', ')).each (index, el) =>
      $el = $(el)
      if $el.val().trim() == ''
        $first = $el unless $first
        TR.UI.setError $el, 'This field cannot be left blank.'
        valid = false
        null
      else
        TR.UI.removeError $el

    $first.smoothScroll(-30, 500) if $first.exists()
    valid


