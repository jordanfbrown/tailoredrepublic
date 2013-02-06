class TR.Views.Cart extends TR.Views.Base
  el: '.carts'

  events:
    'click a.view-customizations': 'toggleCustomizations'
    'click a.edit-customizations': 'editCustomizations'
    'click a.remove': 'removeLineItem'
    'click a.edit-customization-option': 'editCustomizationOption'

  initialize: (options) ->
    @lineItems = new TR.Collections.LineItems options.lineItems

  toggleCustomizations: (e) ->
    e.preventDefault()
    $a = $(e.currentTarget)
    $customizationList = $a.next('.customization-list-wrapper')
    visible = $customizationList.toggle().is ':visible'
    $a.find('.text').text(if visible then 'Hide Customizations' else 'View Customizations')
    $a.find('.arrow-right, .arrow-down')
      .removeClass('arrow-right arrow-down')
      .addClass(if visible then 'arrow-down' else 'arrow-right')

    if visible
      $('body').animate
        scrollTop: $a.offset().top - 200, 1000

  editCustomizations: (e) ->
    e.preventDefault()
    @openCustomizationModal $(e.currentTarget)

  editCustomizationOption: (e) ->
    e.preventDefault()
    $target = $(e.currentTarget)
    customizationType = $target.data 'type'
    @openCustomizationModal $target, customizationType

  openCustomizationModal: ($target, customizationType) ->
    $lineItem = $target.parents '.line-item'
    customizationId = $lineItem.data 'customization-id'
    productId = $lineItem.data 'product-id'
    customization = new TR.Models.Customization id: customizationId
    product = new TR.Models.Product id: productId
    $.when(customization.fetch(), product.fetch()).then(->
      @customizationView = new TR.Views.CustomizationModal product: product, customization: customization
      @customizationView.$el.find(".progress-bar li[data-type=#{customizationType}]").click() if customizationType
    )
    
  removeLineItem: (e) ->
    e.preventDefault()
    @confirmDialog = new TR.Views.DialogModal
      text: 'Are you sure want to remove this item from the cart?',
      confirmText: 'Remove'
      cancelText: 'Cancel'
      action: =>
        $lineItem = $(e.currentTarget).parents('.line-item')
        lineItemId = $lineItem.data('line-item-id')
        lineItem = @lineItems.get lineItemId
        $.ajax({url: "/line_items/#{lineItemId}", type: 'DELETE'}).then(=>
          $lineItem.fadeOut(=>
            $lineItem.remove()
            @lineItems.remove lineItem
            TR.Events.trigger 'removedLineItem'
            @$('.cart-total .price').text('$' + @lineItems.totalPrice())
            unless @$('.line-item').exists()
              @$('.empty-cart').show()
              @$('.cart-total').hide()
          )
        )
