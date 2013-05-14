class TR.Views.Graduation extends TR.Views.GiftCard
  el: '.pages'

  events:
    'submit .graduation-form': 'submitForm'

  submitForm: (e) ->
    e.preventDefault()
    $selected = @$('#card_amount option:selected')
    id = $selected.val()
    price = $selected.html()
    @price = price.substr(1, price.length)
    @addGiftCardToCart id

