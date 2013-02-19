class TR.Collections.LineItems extends TR.Collections.Base
  model: TR.Models.LineItem

  totalPrice: ->
    @reduce (memo, lineItem) ->
      memo + (lineItem.totalPrice())
    , 0
