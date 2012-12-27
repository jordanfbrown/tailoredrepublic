class TR.Views.Shop extends TR.Views.Base
  el: '#shop-display'

  initialize: (options) ->
    @products = new TR.Collections.Products options.products
    @footerView = new TR.Views.Footer()
    @products.each @renderProductView
    new TR.Views.AddSuccessModal {model: @products.first()}
    
  renderProductView: (product) =>
    @$('.suits-wrapper').append new TR.Views.Product({model: product}).render().el