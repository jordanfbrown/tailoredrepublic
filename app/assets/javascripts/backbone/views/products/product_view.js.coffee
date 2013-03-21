class TR.Views.Product extends TR.Views.Base
  el: '.products'

  events:
    'mousemove img.magnify-small': 'magnify'
    'mouseleave img.magnify-small': 'stopMagnify'
    'click a.customize': 'openCustomizationModal'
    'click a.add-to-cart-no-customization': 'addToCartWithoutCustomization'
    'click a.switch-image': 'switchImage'

  initialize: ->
    super()
    mixpanel.track 'Viewed Product', { product: @model.get('name') }
    TR.Analytics.trackEvent 'Products', 'View', @model.get('name')

  magnify: (e) ->
    $target = $(e.currentTarget)
    $imageMagnified = @$('.image-magnified')
    $largeImg = $imageMagnified.find('img')

    minLeft = -($largeImg.width() - $imageMagnified.width())
    minTop = -($largeImg.height() - $imageMagnified.height())
    e.offsetX = e.pageX - $target.offset().left if e.offsetX == undefined
    e.offsetY = e.pageY - $target.offset().top if e.offsetY == undefined
    leftPercentage = e.offsetX / $target.width() * 1.25 - 0.125
    topPercentage = e.offsetY / $target.height() * 1.25 - 0.125
    topPercentage = 0 if topPercentage < 0
    topPercentage = 1 if topPercentage > 1
    leftPercentage = 0 if leftPercentage < 0
    leftPercentage = 1 if leftPercentage > 1
    @$('.image-magnified img').css(left: (minLeft * leftPercentage) + 'px', top: (minTop * topPercentage) + 'px')

    $imageMagnified.fadeIn('slow') unless $imageMagnified.is ':visible'
    @$('.product-summary').hide()

  stopMagnify: (e) ->
    @$('.image-magnified').hide()
    @$('.product-summary').fadeIn('slow')

  openCustomizationModal: (e) ->
    e.preventDefault()
    @customizationView = new TR.Views.CustomizationModal(product: @model)

  addToCartWithoutCustomization: (e) =>
    e.preventDefault()
    @product = @model
    $.post('/line-items', { product_id: @model.get('id') }).then(
      _.bind(TR.addLineItemSuccess, @),
      _.bind(TR.Views.CustomizationModal.prototype.addLineItemFailure, @)
    )

  switchImage: (e) ->
    e.preventDefault()
    $target = $(e.currentTarget)
    newImage = @model.getProductImageById $target.data('id')
    @$('.magnify-small').attr 'src', newImage.medium
    @$('.magnify-large').attr 'src', newImage.original