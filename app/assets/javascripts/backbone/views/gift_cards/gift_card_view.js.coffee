class TR.Views.GiftCard extends TR.Views.Base
  el: '.gift_cards'

  events:
    'click .gift-card-row a': 'openGiftCardDialog'

  openGiftCardDialog: (e) ->
    e.preventDefault()
    @price = $(e.currentTarget).data 'price'
    id = $(e.currentTarget).data 'id'
    @confirmDialog = new TR.Views.DialogModal
      text: "Are you sure you'd like to purchase a $#{@price} gift card? If so, click \"Add To Cart\" to add this item to your cart.",
      confirmText: 'Add To Cart'
      cancelText: 'Cancel'
      action: =>
        @addGiftCardToCart id
        
  addGiftCardToCart: (id) ->
    $.post('/line_items', {product_id: id}).then(@addSuccess, @addFailure)

  addSuccess: =>
    @confirmDialog.close()
    TR.Events.trigger 'addedLineItem'
    @successDialog = new TR.Views.DialogModal
      text: "The $#{@price} gift card has been added to your cart!"
      confirmText: 'View Cart'
      cancelText: 'Close'
      action: ->
        window.location.href = '/cart'


  addFailure: ->
    @failureDialog = new TR.Views.DialogModal
      text: "We're sorry, but there was a problem adding the gift card to your cart. Please try again, and if the problem persists, shoot as an email at help@tailoredrepublic.com"
      confirmOnly: true
      confirmText: 'Ok'

    
