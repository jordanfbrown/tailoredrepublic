class TR.Collections.CartItems extends TR.Collections.Base
  model: TR.Models.CartItem

  totalPrice: ->
    @reduce (memo, value) ->
      memo + value.get('price')
    , 0