class TR.Models.Product extends TR.Models.Base
  url: ->
    super('/products')

  customFabric: ->
    @get('category') == 'suit' && @get('name') == 'Build Your Own Suit'