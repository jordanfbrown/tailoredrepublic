class TR.Collections.LineItems extends TR.Collections.Base
  model: TR.Models.LineItem

  totalPrice: ->
    @reduce (memo, value) ->
      memo + value.get('price')
    , 0