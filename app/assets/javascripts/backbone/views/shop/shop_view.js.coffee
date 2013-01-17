class TR.Views.Shop extends TR.Views.Base
  el: '.suits-wrapper'

  initialize: (options) ->
    @products = new TR.Collections.Products options.products
    @products.each @renderProductView
    $('.product-wrapper:last-child a').eq(0).click()

  renderProductView: (product) =>
    @$el.append new TR.Views.Product({model: product}).render().el