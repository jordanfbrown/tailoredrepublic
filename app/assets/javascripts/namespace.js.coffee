window.TR =
  Pages: {}

  Views: {}

  Models: {}

  Collections: {}

  Events: _.extend {}, Backbone.Events

  VEST_PRICE: 79

  setStripeKey: ->
    Stripe.setPublishableKey $('meta[name=stripe-key]').attr 'content'

  renderProductModal: (e) ->
    e.preventDefault()
    id = $(e.currentTarget).parents('.product-wrapper').data 'id'
    product = @products.get id
    @productModal = new TR.Views.ProductModal({model: product})

  renderSimpleModal: (text) ->
    new TR.Views.DialogModal
      text: text
      confirmText: 'Ok'
      confirmOnly: true

