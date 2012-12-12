class TR.Views.Shop extends TR.Views.Base
  el: '#shop-display'

  initialize: ->
    @.renderModal()

  renderModal: ->
    @shopModalView = new TR.Views.ShopModal().render()
    @shopModalView.$el.insertAfter('#sidebar')
    @shopModalView.reveal()