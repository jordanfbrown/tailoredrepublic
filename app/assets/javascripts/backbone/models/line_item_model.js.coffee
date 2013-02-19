class TR.Models.LineItem extends TR.Models.Base
  url: ->
    super('/line_items')

  totalPrice: ->
    @get('unit_price') * @get('quantity')