#= require ./modal_view

class TR.Views.AddSuccessModal extends TR.Views.Modal
  id: 'add-success-modal'

  events: ->
    _.extend super,
      'click a.keep-shopping': 'close'
    
  initialize: (options) ->
    @product = options.product
    @suggestedProducts = new TR.Collections.Products()
    @suggestedProducts.fetch().then(=>
      @template = @getTemplate 'add_success_modal'
      @render()
    )

  render: ->
    templateData = product: @product.toJSON(), suggestedProducts: @suggestedProducts.toJSON()
    @$el.html @template templateData
    super()