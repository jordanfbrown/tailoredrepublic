class TR.Views.CustomizationModal extends TR.Views.Modal
  id: 'customization-modal'

  events: ->
    _.extend super,
      'click a.customization-option': 'setCustomization'
      'click a.add-to-cart': 'addToCart'
      'click a.save-changes': 'saveChanges'
      'click ul.progress-bar li': 'goToSlide'
      'click a.previous': 'previous'
      'click a.next': 'next'
      'click a.lining-option': 'selectLining'
      'click a.label': 'clickedLabelOnCheckout'
      'click a.advance-slide': 'next'
      'submit #monogram-form': 'submitMonogram'
      'click .advanced-checkbox': 'setAdvancedOption'

  PROGRESS:
    COMPLETED: '/assets/icons/star-stroke.png'
    TODO: '/assets/icons/star-no-stroke.png'
    CURRENT: '/assets/icons/star-filled.png'

  initialize: (options) ->
    @product = options.product
    @customization = options.customization || new TR.Models.Customization()
    @customization.on 'change', @updateCheckoutSlide
    @template = @getTemplate 'customization_modal'
    @checkoutTemplate = @getTemplate 'customization_checkout'
    @render()
    @slider = @$('.customization-list').bxSlider
      pager: off
      controls: off
      infiniteLoop: off
      onSlideBefore: @onSlideBefore
      onSlideAfter: @onSlideAfter
      adaptiveHeight: on
    $(document).on 'keydown.customization', @keydown

  keydown: (e) =>
    if e.which == 37 # Left arrow
      @slider.goToPrevSlide()
    else if e.which == 39 # Right arrow
      @slider.goToNextSlide()

  render: =>
    @$el.html @template @getTemplateData()
    @toggleVestOverlay()
    super()

  onSlideBefore: ($el, oldIndex, newIndex) =>
    @$('.previous').show() if newIndex > 0
    @$('.previous').hide() if newIndex == 0
    @$('.next').show() if newIndex < 12
    @$('.next').hide() if newIndex == 11

    @setProgressBar oldIndex, @PROGRESS.COMPLETED
    @setProgressBar newIndex, @PROGRESS.CURRENT

  onSlideAfter: ($el, oldIndex, newIndex) =>
    if $el.data('type') == 'vest_buttons' && !@customization.get('vest')
      if oldIndex < newIndex then @slider.goToNextSlide() else @slider.goToPrevSlide()

  getTemplateData: ->
    price = parseFloat(@product.get 'price') + if @customization.get 'vest' then TR.VEST_PRICE else 0
    _.extend
      product: @product.toJSON()
      price: price
      vestPrice: TR.VEST_PRICE
      isNew: @customization.isNew()
    , @customization.toJSON()

  updateCheckoutSlide: =>
    @toggleVestOverlay()
    @$('.customization-summary').html @checkoutTemplate @getTemplateData()

  toggleVestOverlay: ->
    @$('.vest-overlay').toggle !@customization.get 'vest'

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

  goToSlide: (e) ->
    e.preventDefault()
    @slider.goToSlide $(e.currentTarget).index()

  submitMonogram: (e) ->
    e.preventDefault()
    @customization.set 'monogram', @$('input[name=monogram]').val()
    @slider.goToNextSlide()

  destroy: ->
    super()
    $(document).off 'keydown.customization'

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
    
  setAdvancedOption: (e) ->
    $checkbox = $(e.currentTarget)
    option = $checkbox.attr 'name'
    value = $checkbox.is ':checked'
    @customization.setByName option, value

  addToCart: (e) ->
    e.preventDefault()
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
