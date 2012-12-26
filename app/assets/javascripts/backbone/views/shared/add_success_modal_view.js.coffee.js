#= require ./modal_view

class TR.Views.AddSuccessModal extends TR.Views.Modal
  id: 'add-success-modal'

  events: ->
    _.extend super
    
  initialize: (options) ->
    @product = options.product
    @templateFunction = @getTemplate 'add_success_modal'
    @render()

  render: ->
    templateData = @product.toJSON()
    @$el.html @templateFunction templateData
    super()