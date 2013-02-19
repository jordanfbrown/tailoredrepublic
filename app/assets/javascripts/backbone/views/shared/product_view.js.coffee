class TR.Views.Product extends TR.Views.Base
  className: 'product-wrapper three columns'

  events:
    'click a': 'renderProductModal'

  initialize: ->
    @template = @getTemplate 'product'

  render: ->
    @$el.html @template @model.toJSON()
    @

  renderProductModal: (e) ->
    e.preventDefault()
    TR.Analytics.trackEvent 'Products', 'View Via Recommended', @model.get('name')
    @productModal = new TR.Views.ProductModal({model: @model})