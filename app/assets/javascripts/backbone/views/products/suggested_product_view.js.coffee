class TR.Views.SuggestedProduct extends TR.Views.Base
  className: 'product-wrapper three columns'

  events:
    'click a': 'trackView'

  initialize: ->
    @template = @getTemplate 'suggested_product'

  render: ->
    templateData = _.extend
      defaultProductImage: @model.defaultProductImage()
    , @model.toJSON()
    @$el.html @template templateData
    @

  trackView: ->
    TR.Analytics.trackEvent 'Products', 'View Via Recommended', @model.get('name')
