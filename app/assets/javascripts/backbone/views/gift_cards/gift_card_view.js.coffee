class TR.Views.GiftCard extends TR.Views.Base
  el: '.gift_cards'

  events:
    'click .gift-card-row a': 'clickGiftCard'

  clickGiftCard: (e) ->
    e.preventDefault()
    @price = $(e.currentTarget).data 'price'
    id = $(e.currentTarget).data 'id'
    @addGiftCardToCart id
        
  addGiftCardToCart: (id) ->
    $.post('/line-items', {product_id: id}).then(@addSuccess, @addFailure)

  addSuccess: =>
    TR.Events.trigger 'addedLineItem'
    @successDialog = new TR.Views.DialogModal
      text: "The $#{@price} gift card has been added to your cart!"
      confirmText: 'Checkout'
      cancelText: 'Close'
      facebookPixel: true
      action: ->
        window.location.href = '/cart'

  addFailure: ->
    @failureDialog = new TR.Views.DialogModal
      text: "We're sorry, but there was a problem adding the gift card to your cart. Please try again, and if the problem persists, shoot as an email at help@tailoredrepublic.com"
      confirmOnly: true
      confirmText: 'Ok'

    
