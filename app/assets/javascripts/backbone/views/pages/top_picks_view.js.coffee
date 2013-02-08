class TR.Views.TopPicks extends TR.Views.Base
  el: '#top-picks'

  events:
    'click .product-wrapper a': 'renderProductModal'

  initialize: (options) ->
    @products = new TR.Collections.Products options.products

  renderProductModal: (e) =>
    e.preventDefault()
    TR.renderProductModal.call @, e