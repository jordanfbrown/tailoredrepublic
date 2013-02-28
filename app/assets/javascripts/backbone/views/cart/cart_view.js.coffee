class TR.Views.Cart extends TR.Views.Base
  el: '.carts'

  events:
    'click a.view-customizations': 'toggleCustomizations'
    'click a.edit-customizations': 'editCustomizations'
    'click a.edit-customization-option': 'editCustomizationOption'
    'click a.remove': 'removeLineItem'
    'change #line_item_quantity': 'updateLineItemQuantity'

  modalOpen: false

  initialize: (options) ->
    @lineItems = new TR.Collections.LineItems options.lineItems
    @lineItems.on 'change remove', @updatePrices
    TR.Events.on 'closeCustomizationModal', @setModalOpen
    @$('select').customSelect()

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

  setModalOpen: =>
    @modalOpen = false

  editCustomizations: (e) ->
    e.preventDefault()
    unless @modalOpen
      @modalOpen = true
      @openCustomizationModal $(e.currentTarget)

  editCustomizationOption: (e) ->
    e.preventDefault()
    unless @modalOpen
      @modalOpen = true
      $target = $(e.currentTarget)
      customizationType = $target.data 'type'
      @openCustomizationModal $target, customizationType

  openCustomizationModal: ($target, customizationType) ->
    $lineItem = $target.parents '.line-item'
    customizationId = $lineItem.data 'customization-id'
    productId = $lineItem.data 'product-id'
    productCategory = $lineItem.data 'product-category'
    customization = new TR.Models.Customization id: customizationId
    product = new TR.Models.Product id: productId
    $.when(customization.fetch(), product.fetch()).then(->
      TR.Analytics.trackEvent 'Customizations', 'Edit', product.get('name')
      @customizationView = new TR.Views.CustomizationModal product: product, customization: customization
      @customizationView.$el.find(".progress-bar li[data-type=#{customizationType}]").click() if customizationType
    )

  updateLineItemQuantity: (e) ->
    $target = $(e.currentTarget)
    $lineItem = $target.parents('.line-item')
    lineItem = @lineItems.get $lineItem.data('line-item-id')
    quantity = parseInt $target.val()
    lineItem.set 'quantity', quantity
    lineItem.save()
    TR.Analytics.trackEvent 'LineItems', 'Update Quantity', $lineItem.data('product-name'), quantity

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
        lineItem.destroy().then(=>
          TR.Analytics.trackEvent 'LineItems', 'Remove', $lineItem.data 'product-name'
          $lineItem.fadeOut(=>
            $lineItem.remove()
            @lineItems.remove lineItem
            TR.Events.trigger 'removedLineItem'
            unless @$('.line-item').exists()
              @$('.empty-cart').show()
              @$('.cart-total').hide()
          )
        )

  updatePrices: (lineItem) =>
    @$(".line-item[data-line-item-id=#{lineItem.id}] .line-item-price").text lineItem.totalPrice()
    @$('.cart-total .price').text '$' + @lineItems.totalPrice()
