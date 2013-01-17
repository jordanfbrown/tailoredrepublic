class TR.Views.CustomizationModal extends TR.Views.Modal
  id: 'customization-modal'

  events: ->
    _.extend super,
      'click a.customization-option': 'setCustomization'
      'click a.add-to-cart': 'addToCart'
      'click a.save-changes': 'saveChanges'
      'click ul.progress-bar a': 'clickedProgressImage'
      'click a.left': 'previous'
      'click a.right': 'next'
      'click a.lining-option': 'selectLining'
      'click a.label': 'clickedLabelOnCheckout'
      'click a.advance-slide': 'next'
      'submit #monogram-form': 'submitMonogram'
      'click .advanced-checkbox': 'setAdvancedOption'

  PROGRESS:
    SELECTED: 'selected'
    COMPLETED: 'completed'

  initialize: (options) ->
    @product = options.product
    @customization = options.customization || new TR.Models.Customization()
    @customization.on 'change', @updateCheckoutSlide
    @template = @getTemplate 'customization_modal'
    @checkoutTemplate = @getTemplate 'customization_checkout'
    @render()
    $(document).on 'keydown.customization', @keydown

  keydown: (e) =>
    if e.which == 37 # Left arrow
      @advanceSlide 'prev'
    else if e.which == 39 # Right arrow
      @advanceSlide 'next'

  render: =>
    @$el.html @template @getTemplateData()
    @toggleVestOverlay()
    super()

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
    e.preventDefault() if e
    @advanceSlide 'prev'

  next: (e) ->
    e.preventDefault() if e
    @advanceSlide 'next'

  advanceSlide: (direction) ->
    $currentCustomization = @getCurrentCustomization()
    $previousOrNext = $currentCustomization[direction] '.customization-wrapper'

    # Skip over the vest button slide if user selected "No vest"
    vestSlide = if direction == 'prev' then 'checkout' else 'vest'
    if $currentCustomization.data('type') == vestSlide && !@customization.get 'vest'
      $previousOrNext = $previousOrNext[direction] '.customization-wrapper'

    if $previousOrNext.exists()
      @switchPane $previousOrNext.data 'type'

  clickedLabelOnCheckout: (e) ->
    e.preventDefault()
    @switchPane $(e.currentTarget).data 'type'

  switchPane: (customizationType) ->
    @resetProgressBar()
    @updateProgressBar customizationType, @PROGRESS.SELECTED

    @getCurrentCustomization().hide()
    @$(".customization-wrapper[data-type=#{customizationType}]").show()

  selectLining: (e) ->
    e.preventDefault()
    @$('.lining-option').removeClass 'selected'
    $lining = $(e.currentTarget).addClass 'selected'
    @customization.set 'lining', $lining.data 'id'
    @updateProgressBar 'lining', @PROGRESS.COMPLETED

  clickedProgressImage: (e) ->
    e.preventDefault()
    @switchPane $(e.currentTarget).parent().data 'type'

  submitMonogram: (e) ->
    e.preventDefault()
    @customization.set 'monogram', @$('input[name=monogram]').val()
    @updateProgressBar 'monogram', @PROGRESS.COMPLETED
    @advanceSlide 'next'

  destroy: ->
    super()
    $(document).off 'keydown.customization'

  getCurrentCustomization: ->
    @$('.customization-wrapper:visible')

  setCustomization: (e) =>
    e.preventDefault()

    # Update model
    $target = $(e.currentTarget)
    $img = $target.find 'img:not(.shield)'
    option = $target.data 'option'
    type = $target.parents('.customization-wrapper').data 'type'
    
    @updateProgressBar type, @PROGRESS.COMPLETED

    @customization.setByName type, option
    @clearChecked()
    $img.addClass 'checked'
    @advanceSlide 'next'
    
  setAdvancedOption: (e) ->
    $checkbox = $(e.currentTarget)
    option = $checkbox.attr 'name'
    value = $checkbox.is ':checked'

    @updateProgressBar 'advanced', @PROGRESS.COMPLETED
    @customization.setByName option, value

  updateProgressBar: (type, state) ->
    $star = @$(".progress-bar li[data-type=#{type}] img")
    image = if state == 'selected' then 'star-filled.png' else 'star-stroke.png'
    $star.attr('src', "/assets/icons/#{image}").addClass state

  resetProgressBar: ->
    $star = @$('.progress-bar li').find 'img.selected'
    image = if $star.hasClass 'completed' then 'star-stroke.png' else 'star-no-stroke.png';
    $star.attr('src', "/assets/icons/#{image}").removeClass 'selected'

  addToCart: (e) ->
    e.preventDefault()
    @customization.save(null, {silent: true}).then(=>
      $.post('/line_items', {product_id: @product.get('id'), customization_id: @customization.get('id')}).then(
        @addSuccess, @addFailure
      )
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

  addFailure: (error) =>
    console.log(error, 'failure');

  clearChecked: =>
    @$('a.customization-option:visible img').removeClass 'checked'
