window.TR =
  Pages: {}

  Views: {}

  Models: {}

  Collections: {}

  Events: _.extend {}, Backbone.Events

  UI:
    setError: ($input, message) ->
      $input.addClass 'error'

      if $input.next('.error').exists()
        $input.next('.error').text message
      else
        $('<small class="error">' + message + '</small>').insertAfter $input

    removeError: ($input) ->
      $input.removeClass('error').next('.error').fadeOut()

  Analytics:
    trackTransaction: (order, lineItems, address) ->
      if TR.ENVIRONMENT == 'production'
        _gaq.push [
          '_addTrans'
          order.order_id # Transaction ID
          'Tailored Republic' # Affiliation
          order.final_cost # Total, including tax and shipping
          order.tax # Tax
          0 # Shipping
          address.city # City
          address.state # State
          'USA' # Country
        ]

        for lineItem in lineItems
          _gaq.push [
            '_addItem'
            order.order_id # Transaction ID
            lineItem.id # SKU/Code
            lineItem.name # Product name
            lineItem.category # Category
            lineItem.total_price # Unit price
            lineItem.quantity
          ]

        _gaq.push ['_trackTrans']

    trackEvent: (category, action, label, value) ->
      if TR.ENVIRONMENT == 'production'
        event = ['_trackEvent', category, action]
        event.push(label) if label || label == 0
        event.push(value) if value || value == 0
        _gaq.push event

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

  imgSrc: (path) ->
    TR.ASSET_HOST + '/assets/' + (if TR.ENVIRONMENT == 'production' || TR.ENVIRONMENT == 'staging' then TR.ASSET_DIGESTS[path] else path)

