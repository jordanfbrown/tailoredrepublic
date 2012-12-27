class TR.Views.Shop extends TR.Views.Base
  el: '.suits-wrapper'

  initialize: (options) ->
    @products = new TR.Collections.Products options.products
    @footerView = new TR.Views.Footer()
    @products.each @renderProductView
    new TR.Views.AddSuccessModal {model: @products.first()}
    
  renderProductView: (product) =>
    @$el.append new TR.Views.Product({model: product}).render().el