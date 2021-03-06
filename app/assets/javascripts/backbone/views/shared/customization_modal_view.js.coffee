class TR.Views.CustomizationModal extends TR.Views.Modal
  id: 'customization-modal'

  className: 'reveal-modal xlarge'

  events: ->
    _.extend super,
      'click a.customization-option': 'setCustomization'
      'click a.add-to-cart': 'addToCart'
      'click a.accept': 'acceptCustomizations'
      'click a.save-changes': 'saveChanges'
      'click ul.progress-bar li': 'goToSlide'
      'click a.previous': 'previous'
      'click input.skip': 'next'
      'click a.next': 'next'
      'click a.advance-slide': 'next'
      'click a.lining-option': 'selectLining'
      'click a.label': 'clickedLabelOnCheckout'
      'click .monogram-colors li': 'setMonogramColor'
      'mousemove a.fabric': 'magnify'
      'submit #monogram-form': 'submitMonogram'

  hideScrollbar: false

  initialize: (options) ->
    super()
    @errorMessage = "We're sorry, but there was a problem adding the product to your cart. Please try again, and if the problem persists, shoot as an email at help@tailoredrepublic.com."
    @product = options.product
    @customization = options.customization || new TR.Models.Customization {}, {product: @product}
    @customization.on 'change', @updateCheckoutSlide
    @template = @getTemplate 'customization_modal'
    @checkoutTemplate = @getTemplate "customization_checkout_#{@product.get('category')}"
    @render()

    $(document).on 'keydown.customization', @keydown
    $(window).on 'resize.customization', @resize
    @resize()
    mixpanel.track 'Clicked Customize', { product: @product.get('name') }
    TR.Analytics.trackEvent 'Customizations', 'View', @product.get('name')

    @slider = @$('.customization-list').bxSlider
      pager: off
      controls: off
      infiniteLoop: off
      onSlideBefore: @onSlideBefore
      adaptiveHeight: on
      touchEnabled: off
      useCSS: off

  render: =>
    @$el.html @template @getTemplateData()
    super()
    @setMagnifierMaxHeight()

  keydown: (e) =>
    if e.which == 37 # Left arrow
      @slider.goToPrevSlide()
    else if e.which == 39 # Right arrow
      @slider.goToNextSlide()

  resize: =>
    @setMagnifierMaxHeight()
    if $(window).width() < 1024
      @$el.removeClass('xlarge').addClass('expand')
    else
      @$el.removeClass('expand').addClass('xlarge')

  onSlideBefore: ($el, oldIndex, newIndex) =>
    slideCount = @slider.getSlideCount()
    @$('.previous').show() if newIndex > 0
    @$('.previous').hide() if newIndex == 0
    @$('.next, .accept').text(if @customization.isNew() then 'Add To Cart' else 'Save Changes').removeClass('next').addClass('accept') if newIndex + 1 == slideCount
    @$('.next, .accept').text('Next').removeClass('accept').addClass('next') if newIndex + 1 < slideCount

    @setProgressBar newIndex
    @updateCurrentCustomization newIndex
    _.delay @checkModalHeight, 100

  getTemplateData: ->
    {
      product: @product.toJSON()
      price: @calculatePrice()
      vestPrice: TR.VEST_PRICE
      pickStitchingPrice: TR.PICK_STITCHING_PRICE
      shirtMonogramPrice: TR.SHIRT_MONOGRAM_PRICE
      isNew: @customization.isNew()
      customizationOptions: @product.getCustomizationOptions @customization
      customization: @customization.toJSON()
    }

  calculatePrice: ->
    adders = 0
    adders += TR.VEST_PRICE if @customization.get 'vest'
    adders += TR.PICK_STITCHING_PRICE if @customization.get 'pick_stitching'
    adders += TR.SHIRT_MONOGRAM_PRICE if @customization.get('monogram').length > 0 && @product.get('category') == 'shirt'
    parseFloat(@product.get 'price') + adders

  updateCheckoutSlide: =>
    @$('.customization-summary').html @checkoutTemplate @getTemplateData()

  previous: (e) ->
    e.preventDefault()
    @slider.goToPrevSlide()
    TR.Analytics.trackEvent 'Customizations', 'Click', 'Previous'

  next: (e) ->
    e.preventDefault()
    @slider.goToNextSlide()
    TR.Analytics.trackEvent 'Customizations', 'Click', 'Next'

  clickedLabelOnCheckout: (e) ->
    e.preventDefault()
    type = $(e.currentTarget).data 'type'
    index = @$(".customization-wrapper[data-type=#{type}]").index()
    @slider.goToSlide index

  selectLining: (e) ->
    e.preventDefault()
    @$('.lining-option').removeClass 'selected'
    $lining = $(e.currentTarget).addClass 'selected'
    @customization.set 'lining', $lining.data 'id'
    @slider.goToNextSlide()
    TR.Analytics.trackEvent 'Customizations', 'Choose Lining', $lining.data('id')

  goToSlide: (e) ->
    e.preventDefault()
    @slider.goToSlide $(e.currentTarget).index()

  submitMonogram: (e) ->
    e.preventDefault()
    @customization.set 'monogram', @$('input[name=monogram]').val()
    @slider.goToNextSlide()

  destroy: ->
    TR.Events.trigger 'closeCustomizationModal'
    $(document).off 'keydown.customization'
    $(document).off 'resize.customization'
    super()

  getCurrentCustomization: ->
    @$('.customization-wrapper:visible')

  setCustomization: (e) =>
    e.preventDefault()

    $target = $(e.currentTarget)
    option = $target.data 'option'
    type = $target.parents('.customization-wrapper').data 'type'

    @customization.setByName type, option
    @clearSelected()
    $target.addClass 'selected'
    @slider.goToNextSlide()
    TR.Analytics.trackEvent 'Customizations', "Choose #{type}", option

  setMonogramColor: (e) =>
    $target = $(e.currentTarget)
    @$('.monogram-colors li').removeClass 'selected'
    $target.addClass 'selected'
    color = $target.data 'color'
    @customization.set 'monogram_color', color

  acceptCustomizations: (e) ->
    e.preventDefault()
    if @checkButtonState $(e.currentTarget)
      if @customization.isNew() then @saveCustomization() else @updateCustomization()

  checkButtonState: ($button) ->
    if $button.hasClass 'disabled'
      false
    else
      $button.addClass 'disabled'
      true

  addToCart: (e) ->
    e.preventDefault()
    @saveCustomization() if @checkButtonState $(e.currentTarget)

  addLineItem: =>
    $.post('/line-items', {product_id: @product.get('id'), customization_id: @customization.get('id')}).then(
      @addSuccess, @addLineItemFailure
    )

  saveCustomization: ->
    @customization.save(null, {silent: true}).then(@addLineItem, @addCustomizationFailure)

  updateCustomization: ->
    TR.Analytics.trackEvent 'LineItems', 'Save Changes', @product.get('name')
    @customization.save(null, {silent: true}).then(=>
      window.location.href = '/cart'
    , =>
      TR.renderSimpleModal "We're sorry, but there was a problem updating the customizations. Please try again, and if the problem persists, shoot as an email at help@tailoredrepublic.com."
    )

  saveChanges: (e) ->
    e.preventDefault()
    @updateCustomization() if @checkButtonState $(e.currentTarget)

  addSuccess: (response) =>
    TR.addLineItemSuccess.call @
    @destroy()

  addLineItemFailure: (error) =>
    TR.renderSimpleModal @errorMessage

  addCustomizationFailure: (error) =>
    TR.renderSimpleModal @errorMessage

  clearSelected: =>
    @$('.customization-wrapper').eq(@slider.getCurrentSlide()).find('.customization-option').removeClass 'selected'

  setProgressBar: (index) ->
    @$('.progress-bar li').removeClass 'selected'
    @$('.progress-bar li').eq(index).addClass 'selected'

  updateCurrentCustomization: (index) ->
    @$('.current-customization').text TR.titleize(@$('.progress-bar li').eq(index).data('type'))

  setMagnifierMaxHeight: =>
    @$('.image-magnified').css('max-height': 250, 'height': 250)

  magnify: (e) ->
    $target = $(e.currentTarget)
    $imageMagnified = @$('.image-magnified')
    $largeImg = $imageMagnified.find('img')

    unless $target.hasClass 'current'
      @$('.fabric').removeClass 'current'
      $target.addClass 'current'
      $largeImg.attr 'src', TR.imgSrc $target.data 'large'
      @$('.fabric-label').text $target.data 'label'

    TR.Views.Product.prototype.magnify.call @, e

  close: =>
    TR.Analytics.trackEvent 'Customizations', 'Close', @product.get('name')
    super()
