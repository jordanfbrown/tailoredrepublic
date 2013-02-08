window.TR =
  Pages: {}

  Views: {}

  Models: {}

  Collections: {}

  Events: _.extend {}, Backbone.Events

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

  createSlideshow: ->
    $('#slideshow').orbit
      afterSlideChange: (previous, current) =>
        data = $(current).data()
        $caption = $('#lookbook-info')
        $caption.fadeOut(->
          _.each data, (value, attribute) ->
            $caption.find('.' + attribute).text value
          $caption.fadeIn()
        )
      resetTimerOnClick: on

  uppercaseFirst: (str) ->
    str.substr(0,1).toUpperCase() + str.substr 1, str.length

  # Takes a string in the form "an-example-string" or "an_example_string" and returns "An Example String"
  titleize: (str) ->
    (_.map str.split(/[-_]/), TR.uppercaseFirst).join ' '
    
  convertFromUnderscored: (str) ->
    (_.map str.split(/[-_]/), (word, index) ->
      if index == 0 then TR.uppercaseFirst(word) else word
    ).join ' '

