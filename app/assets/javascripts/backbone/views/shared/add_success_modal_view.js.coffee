#= require ./modal_view

class TR.Views.AddSuccessModal extends TR.Views.Modal
  id: 'add-success-modal'

  hideScrollbar: false

  events: ->
    _.extend super,
      'click a.keep-shopping': 'close'

  initialize: ->
    super()
    @subviews = []
    productParams = data: $.param(suggested: true, product_id: @model.get 'id')
    @suggestedProducts = new TR.Collections.Products()
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