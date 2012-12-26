class TR.Views.Shop extends TR.Views.Base
  el: '#shop-display'

  events:
    'click .product-wrapper a': 'renderProductModal'

  initialize: (options) ->
    @products = new TR.Collections.Products options.products
    @footerView = new TR.Views.Footer()

    new TR.Views.AddSuccessModal {product: @products.first()}

  renderProductModal: (e) ->
    e.preventDefault()
    id = $(e.currentTarget).parents('.product-wrapper').data('id')
    product = @products.get id
    @productModal = new TR.Views.ProductModal({model: product})