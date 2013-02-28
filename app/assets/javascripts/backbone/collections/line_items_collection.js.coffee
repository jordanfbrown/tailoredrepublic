class TR.Collections.LineItems extends TR.Collections.Base
  model: TR.Models.LineItem

  totalPrice: ->
    @reduce (memo, lineItem) ->
      memo + (lineItem.totalPrice())
    , 0

  canSkipMeasurements: ->
    !(@any (lineItem) -> lineItem.get('category') == 'suit' || lineItem.get('category') == 'shirt')
