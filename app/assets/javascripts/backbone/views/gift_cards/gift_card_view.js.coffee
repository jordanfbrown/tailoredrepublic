class TR.Views.GiftCard extends TR.Views.Base
  el: '.gift_cards'

  events:
    'click .gift-card-row a': 'openGiftCardDialog'

  openGiftCardDialog: (e) ->
    e.preventDefault()
    price = $(e.currentTarget).data 'price'
    @confirmDialog = new TR.Views.DialogModal
      text: "Are you sure you'd like to purchase a $#{price} gift card? If so, click \"Add To Cart\" to add this item to your cart.",
      confirmText: 'Add To Cart'
      cancelText: 'Cancel'
      action: =>
        @addGiftCardToCart price
        
  addGiftCardToCart: (price) ->
    console.log 'adding', price

    
