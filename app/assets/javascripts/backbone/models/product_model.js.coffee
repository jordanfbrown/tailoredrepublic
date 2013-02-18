class TR.Models.Product extends TR.Models.Base
  url: ->
    super('/products')

  customFabric: ->
    @get('category') == 'suit' && @get('name') == 'Build Your Own Suit'

  isCustomizable: ->
    @get('category') == 'suit' || @get('category') == 'shirt'
    
  defaultProductImage: ->
    _.find @get('product_images'), (image) ->
      image.default

  getProductImageById: (id) ->
    _.find @get('product_images'), (image) ->
      image.id == id

