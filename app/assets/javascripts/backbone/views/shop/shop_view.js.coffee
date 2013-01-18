class TR.Views.Shop extends TR.Views.Base
  el: '.products-wrapper'

  initialize: (options) ->
    @products = new TR.Collections.Products options.products
    @products.each @renderProductView
    @$('.product-wrapper a:first-child').eq(0).click()

  renderProductView: (product) =>
    @$el.append new TR.Views.Product({model: product}).render().el