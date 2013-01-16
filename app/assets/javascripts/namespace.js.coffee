window.TR =
  Pages: {}

  Views: {}

  Models: {}

  Collections: {}

  Events: _.extend {}, Backbone.Events

  VEST_PRICE: 79

  setStripeKey: ->
    Stripe.setPublishableKey $('meta[name=stripe-key]').attr 'content'

  createStripeToken: (callback) ->
    Stripe.createToken
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      exp_month: $('#card_month').val()
      exp_year: $('#card_year').val()
      name: $('#billing_address_name').val()
      address_line1: $('#billing_address_line1').val()
      address_line2: $('#billing_address_line2').val()
      address_city: $('#billing_address_city').val()
      address_state: $('#billing_address_state').val()
      address_zip: $('#billing_address_zip').val()
    , callback

