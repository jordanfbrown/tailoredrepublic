#= require ./modal_view

class TR.Views.AddSuccessModal extends TR.Views.Modal
  id: 'add-success-modal'

  hideScrollbar: false

  subviews: []

  events: ->
    _.extend super,
      'click a.keep-shopping': 'close'

  initialize: ->
    super()
    TR.Analytics.trackFacebookEvent '6011407244120'
    @getSuggestedProducts()

  getSuggestedProducts: ->
    @suggestedProducts = new TR.Collections.Products()
    productParams = data: $.param(suggested: true, product_id: @model.get 'id')
    @suggestedProducts.fetch(productParams).then(=>
      @template = @getTemplate 'add_success_modal'
      @render()
    )

  render: ->
    templateData = product: @model.toJSON(), suggestedProducts: @suggestedProducts.toJSON()
    @$el.html @template templateData
    @suggestedProducts.each @renderSuggestedProductView
    super()
    
  close: (e) =>
    e.preventDefault()
    subview.destroy() for subview in @subviews
    super()

  renderSuggestedProductView: (product) =>
    suggestedProductView = new TR.Views.SuggestedProduct({model: product}).render()
    @$('.products-wrapper').append suggestedProductView.el
    @subviews.push suggestedProductView