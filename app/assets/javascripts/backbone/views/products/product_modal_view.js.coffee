#= require ../shared/modal_view

class TR.Views.ProductModal extends TR.Views.Modal
  id: 'product-modal'

  className: 'reveal-modal xlarge'

  events: ->
    _.extend super,
      'mousemove img.magnify-small': 'magnify'
      'mouseleave img.magnify-small': 'stopMagnify'
      'click a.customize': 'openCustomizationModal'
      'click a.add-to-cart-no-customization': 'addToCartWithoutCustomization'
      'click a.switch-image': 'switchImage'

  initialize: ->
    super()
    @template = @getTemplate 'product_modal'
    $(window).on 'resize.product', @resize
    @resize()
    @render()
    mixpanel.track 'Viewed Product', { product: @product.get('name') }
    TR.Analytics.trackEvent 'Products', 'View', @model.get('name')

  render: ->
    @$el.html @template _.extend
      customizable: @model.isCustomizable()
      defaultProductImage: @model.defaultProductImage()
    , @model.toJSON()
    super()
    _.delay @setMagnifierMaxHeight, 500

  hideScrollbar: false

  resize: =>
    if $(window).width() < 1024
      @$el.removeClass('xlarge').addClass('expand')
    else
      @$el.removeClass('expand').addClass('xlarge')

    @setMagnifierMaxHeight()

  setMagnifierMaxHeight: =>
    height = if $(window).width() < 768 then 250 else @$el.height() - 100 + 'px'
    @$('.image-magnified').css('max-height': height, 'height': height)

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

    $imageMagnified.show()
    @$('.product-summary').hide()

  stopMagnify: (e) ->
    @$('.image-magnified').hide()
    @$('.product-summary').show()

  openCustomizationModal: (e) ->
    e.preventDefault()
    @destroy()
    @customizationView = new TR.Views.CustomizationModal(product: @model)

  addToCartWithoutCustomization: (e) =>
    e.preventDefault()
    @product = @model
    $.post('/line-items', { product_id: @model.get('id') }).then(
      _.bind(TR.Views.CustomizationModal.prototype.addSuccess, @),
      _.bind(TR.Views.CustomizationModal.prototype.addLineItemFailure, @)
    )

  switchImage: (e) ->
    e.preventDefault()
    $target = $(e.currentTarget)
    newImage = @model.getProductImageById $target.data('id')
    @$('.magnify-small').attr 'src', newImage.medium
    @$('.magnify-large').attr 'src', newImage.original

  close: =>
    TR.Analytics.trackEvent 'Products', 'Close', @model.get('name')
    super()

  destroy: ->
    $(window).off 'resize.product'
    super()


