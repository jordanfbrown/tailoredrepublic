#= require ./modal_view

class TR.Views.AddSuccessModal extends TR.Views.Modal
  id: 'add-success-modal'

  events: ->
    _.extend super,
      'click a.keep-shopping': 'close'
    
  initialize: ->
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
    @suggestedProducts.each @renderProductView
    super()
    
  close: ->
    subview.destroy() for subview in @subviews
    super()

  renderProductView: (product) =>
    productView = new TR.Views.Product({model: product}).render()
    @$('.products-wrapper').append productView.el
    @subviews.push productView