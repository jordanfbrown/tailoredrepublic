class TR.Views.Cart extends TR.Views.Base
  el: '.carts'

  events:
    'click a.edit-customizations': 'editCustomizations'

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
