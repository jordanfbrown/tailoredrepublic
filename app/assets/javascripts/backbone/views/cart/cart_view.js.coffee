class TR.Views.Cart extends TR.Views.Base
  el: '.carts'

  events:
    'click a.view-customizations': 'viewCustomizations'
    'click a.edit-customizations': 'editCustomizations'
    'click a.remove': 'removeCartItem'
    'click a.edit-customization-option': 'editCustomizationOption'

  initialize: (options) ->
    @cartItems = new TR.Collections.CartItems options.cartItems

  viewCustomizations: (e) ->
    $a = $(e.currentTarget)
    $customizationList = $a.next('.customization-list-wrapper')
    visible = $customizationList.toggle().is ':visible'
    $a.text(if visible then 'Hide Customizations' else 'View Customizations')
    $a.prev('span').removeClass('arrow-right arrow-down').addClass(if visible then 'arrow-down' else 'arrow-right')

  editCustomizations: (e) ->
    e.preventDefault()
    @openCustomizationModal $(e.currentTarget)

  editCustomizationOption: (e) ->
    e.preventDefault()
    $target = $(e.currentTarget)
    customizationType = $target.data 'type'
    @openCustomizationModal $target, customizationType

  openCustomizationModal: ($target, customizationType) ->
    $cartItem = $target.parents '.cart-item'
    customizationId = $cartItem.data 'customization-id'
    productId = $cartItem.data 'product-id'
    customization = new TR.Models.Customization id: customizationId
    product = new TR.Models.Product id: productId
    $.when(customization.fetch(), product.fetch()).then(->
      @productModalView = new TR.Views.ProductModal model: product, customization: customization
      if customizationType then @productModalView.$el.find("li[data-type=#{customizationType}] a").click()
    )
    
  removeCartItem: (e) ->
    e.preventDefault()
    confirmOptions = {
      text: 'Are you sure want to remove this item from the cart?',
      action: =>
        $cartItem = $(e.currentTarget).parents('.cart-item')
        cartItemId = $cartItem.data('cart-item-id')
        cartItem = @cartItems.get cartItemId
        $.ajax({url: "/cart_items/#{cartItemId}", type: 'DELETE'}).then(=>
          $cartItem.fadeOut(=>
            $cartItem.remove()
            @cartItems.remove cartItem
            TR.Events.trigger 'removedCartItem'
            @$('.cart-total .price').text('$' + @cartItems.totalPrice())
            unless @$('.cart-item').exists()
              @$('.empty-cart').show()
              @$('.cart-total').hide()
          )
        )
    }
    @confirmDialog = new TR.Views.DialogModal(confirmOptions)

