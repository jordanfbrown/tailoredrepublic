class TR.Views.Cart extends TR.Views.Base
  el: '.carts'

  events:
    'click a.edit-customizations': 'editCustomizations'
    'click a.remove': 'removeCartItem'

  editCustomizations: (e) ->
    e.preventDefault()
    $cartItem = $(e.currentTarget).parents '.cart-item'
    customizationId = $cartItem.data 'customization-id'
    productId = $cartItem.data 'product-id'
    customization = new TR.Models.Customization id: customizationId
    product = new TR.Models.Product id: productId
    $.when(customization.fetch(), product.fetch()).then(->
      @productModalView = new TR.Views.ProductModal model: product, customization: customization
    )

  removeCartItem: (e) ->
    e.preventDefault()
    confirmOptions = {
      text: 'Are you sure want to remove this item from the cart?',
      action: =>
        $cartItem = $(e.currentTarget).parents('.cart-item')
        cartItemId = $cartItem.data('cart-item-id')
        $.ajax({url: "/cart_items/#{cartItemId}", type: 'DELETE'}).then(=>
          $cartItem.fadeOut(=>
            $cartItem.remove()
            unless @$('.cart-item').exists()
              @$('.empty-cart').show()
          )
        )
    }
    @confirmDialog = new TR.Views.DialogModal(confirmOptions)

