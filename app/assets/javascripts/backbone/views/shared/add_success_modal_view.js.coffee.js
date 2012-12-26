#= require ./modal_view

class TR.Views.AddSuccessModal extends TR.Views.Modal

  events: ->
    _.extend super
    
  initialize: (options) ->
    @product = options.product

  render: ->
    @$el.html "<h1>#{@product.get('name')}</h1>"
    super()