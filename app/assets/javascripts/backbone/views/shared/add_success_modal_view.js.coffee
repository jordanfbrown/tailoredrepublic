#= require ./modal_view

class TR.Views.AddSuccessModal extends TR.Views.Modal
  id: 'add-success-modal'

  events: ->
    _.extend super,
      'click a.keep-shopping': 'close'
    
  initialize: ->
    @subviews = []
    @suggestedProducts = new TR.Collections.Products()
    @suggestedProducts.fetch().then(=>
      @template = @getTemplate 'add_success_modal'
      @render()
    )

  render: ->
    templateData = product: @model.toJSON(), suggestedProducts: @suggestedProducts.toJSON()
    @$el.html @template templateData
    @suggestedProducts.each @renderProductView
    super()
    
  close: ->
    _.each @subviews, (subview) ->
      subview.destroy()
    super()

  renderProductView: (product) =>
    productView = new TR.Views.Product({model: product}).render()
    @$('.suits-wrapper').append productView.el
    @subviews.push productView