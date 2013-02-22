class TR.Views.ShowProduct extends TR.Views.ProductModal
  el: '.products'

  events: ->
    _.extend super,
      'click a.customize': 'openCustomizationModal'

  initialize: ->

  openCustomizationModal: (e) ->
    e.preventDefault()
    @customizationView = new TR.Views.CustomizationModal(product: @model)

  destroy: ->
