class TR.Views.Shop extends TR.Views.Base
  el: '.products-wrapper'

  events:
    'click .product-wrapper a': 'renderProductModal'

  initialize: (options) ->
    @products = new TR.Collections.Products options.products

  renderProductModal: (e) =>
    TR.renderProductModal.call @, e