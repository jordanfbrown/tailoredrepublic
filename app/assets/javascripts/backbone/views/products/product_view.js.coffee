class TR.Views.Product extends TR.Views.Base
  el: '.products'

  events:
    'mousemove img.magnify-small': 'magnify'
    'mouseleave img.magnify-small': 'stopMagnify'
    'click a.customize': 'openCustomizationModal'
    'click a.add-to-cart-no-customization': 'addToCartWithoutCustomization'
    'click a.switch-image': 'switchImage'
    'click .pagination a': 'loadReviews'

  initialize: (options) ->
    super()
    @$('img.magnify-small').on 'load', @setMagnifierHeight
    $(window).on 'resize', @setMagnifierHeight
    @paginatedReviewPath = options.paginatedReviewPath
    mixpanel.track 'Viewed Product', { product: @model.get('name') }
    TR.Analytics.trackEvent 'Products', 'View', @model.get('name')
    
  setMagnifierHeight: =>
    height = @$('img.magnify-small').height()
    @$('.image-magnified').css 'height': height, 'max-height', height

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

  loadReviews: (e) ->
    e.preventDefault()
    page = $(e.currentTarget).attr('href').split('=')[1]
    $.get(@paginatedReviewPath, { page: page }).then @loadReviewsSuccess, @loadReviewsFailure
    
  loadReviewsSuccess: (reviewsList) =>
    @$('.reviews-list-wrapper').replaceWith reviewsList
  
  loadReviewsFailure: =>
    TR.renderSimpleModal "We're sorry, but something went wrong while trying to load the product reviews. Please try again, and if the problem persists, shoot as an email at help@tailoredrepublic.com."

