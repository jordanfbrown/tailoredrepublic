class TR.Views.CustomizationModal extends TR.Views.Modal
  id: 'customization-modal'

  className: 'reveal-modal xlarge'

  events: ->
    _.extend super,
      'click a.customization-option': 'setCustomization'
      'click a.add-to-cart': 'addToCart'
      'click a.save-changes': 'saveChanges'
      'click ul.progress-bar li': 'goToSlide'
      'click a.previous': 'previous'
      'click a.next': 'next'
      'click a.lining-option': 'selectLining'
      'click a.fabric-option': 'selectFabric'
      'click a.label': 'clickedLabelOnCheckout'
      'click a.advance-slide': 'next'
      'submit #monogram-form': 'submitMonogram'

  initialize: (options) ->
    super()
    @product = options.product
    @customization = options.customization || new TR.Models.Customization({}, {
      category: @product.get('category')
      customFabric: @product.customFabric()
    })
    @customization.on 'change', @updateCheckoutSlide
    @template = @getTemplate "customization_modal_#{@product.get('category')}"
    @checkoutTemplate = @getTemplate "customization_checkout_#{@product.get('category')}"
    @render()

    $(document).on 'keydown.customization', @keydown
    $(window).on 'resize.customization', @resize
    @resize()

    @slider = @$('.customization-list').bxSlider
      pager: off
      controls: off
      infiniteLoop: off
      onSlideBefore: @onSlideBefore
      onSlideAfter: @onSlideAfter
      adaptiveHeight: on
      touchEnabled: off

    @PROGRESS =
      COMPLETED: TR.ASSET_HOST + '/assets/icons/star-stroke.png'
      TODO: TR.ASSET_HOST + '/assets/icons/star-no-stroke.png'
      CURRENT: TR.ASSET_HOST + '/assets/icons/star-filled.png'

  render: =>
    @$el.html @template @getTemplateData()
    super()

  keydown: (e) =>
    if e.which == 37 # Left arrow
      @slider.goToPrevSlide()
    else if e.which == 39 # Right arrow
      @slider.goToNextSlide()

  resize: =>
    if $(window).width() < 1024
      @$el.removeClass('xlarge').addClass('expand')
    else
      @$el.removeClass('expand').addClass('xlarge')

  onSlideBefore: ($el, oldIndex, newIndex) =>
    slideCount = @slider.getSlideCount()
    @$('.previous').show() if newIndex > 0
    @$('.previous').hide() if newIndex == 0
    @$('.next').show() if newIndex < slideCount
    @$('.next').hide() if newIndex == slideCount - 1

    @setProgressBar oldIndex, @PROGRESS.COMPLETED
    @setProgressBar newIndex, @PROGRESS.CURRENT

  getTemplateData: ->
    price = @calculatePrice()
    _.extend
      product: @product.toJSON()
      price: price
      vestPrice: TR.VEST_PRICE
      pickStitchingPrice: TR.PICK_STITCHING_PRICE
      shirtMonogramPrice: TR.SHIRT_MONOGRAM_PRICE
      isNew: @customization.isNew()
      chooseFabric: @product.customFabric()
    , @customization.toJSON()

  calculatePrice: ->
    adders = 0
    adders += TR.VEST_PRICE if @customization.get 'vest'
    adders += TR.PICK_STITCHING_PRICE if @customization.get 'pick_stitching'
    adders += TR.SHIRT_MONOGRAM_PRICE if @customization.hasShirtMonogram()
    parseFloat(@product.get 'price') + adders

  updateCheckoutSlide: =>
    @$('.customization-summary').html @checkoutTemplate @getTemplateData()

  previous: (e) ->
    e.preventDefault()
    @slider.goToPrevSlide()

  next: (e) ->
    e.preventDefault()
    @slider.goToNextSlide()

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

  selectFabric: (e) ->
    e.preventDefault()
    @$('.fabric-option').removeClass 'selected'
    $fabric = $(e.currentTarget).addClass 'selected'
    @customization.set 'fabric', $fabric.data 'id'
    @slider.goToNextSlide()

  goToSlide: (e) ->
    e.preventDefault()
    @slider.goToSlide $(e.currentTarget).index()

  submitMonogram: (e) ->
    e.preventDefault()
    @customization.set 'monogram', @$('input[name=monogram]').val()
    @slider.goToNextSlide()

  destroy: ->
    $(document).off 'keydown.customization'
    $(document).off 'resize.customization'
    super()

  getCurrentCustomization: ->
    @$('.customization-wrapper:visible')

  setCustomization: (e) =>
    e.preventDefault()

    $target = $(e.currentTarget)
    $img = $target.find 'img:not(.shield)'
    option = $target.data 'option'
    type = $target.parents('.customization-wrapper').data 'type'

    @customization.setByName type, option
    @clearChecked()
    $img.addClass 'checked'
    @slider.goToNextSlide()

  addToCart: (e) ->
    e.preventDefault()
    $button = $(e.currentTarget)
    unless $button.hasClass 'disabled'
      $button.addClass 'disabled'
      @customization.save(null, {silent: true}).then(@addLineItem, @addCustomizationFailure)

  addLineItem: =>
    $.post('/line_items', {product_id: @product.get('id'), customization_id: @customization.get('id')}).then(
      @addSuccess, @addLineItemFailure
    )

  saveChanges: (e) ->
    e.preventDefault()
    @customization.save(null, {silent: true}).then(=>
      window.location.href = '/cart'
    )
    
  addSuccess: (response) =>
    TR.Events.trigger 'addedLineItem', product: @product
    new TR.Views.AddSuccessModal({model: @product})
    @destroy()

  addLineItemFailure: (error) =>
    console.log(error, 'failure');

  addCustomizationFailure: (error) =>
    console.log(error, 'failure');

  clearChecked: =>
    @$('.customization-wrapper').eq(@slider.getCurrentSlide()).find('img').removeClass 'checked'

  setProgressBar: (index, progress) ->
    @$('.progress-bar img').eq(index).attr 'src', progress
