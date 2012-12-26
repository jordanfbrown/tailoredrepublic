class TR.Views.Customization extends TR.Views.Base
  $checkmark: $('<span>&#x2713;</span>')

  events:
    'click a.customization-option': 'setCustomization'
    'click a.add-to-cart': 'addToCart'
    'click ul.chevrons a': 'clickedChevron'
    'click a.left': 'previous'
    'click a.right': 'next'
    'click a.lining-option': 'selectLining'
    'click a.label': 'clickedLabelOnCheckout'
    'blur input[name=monogram]': 'setMonogram'

  CHEVRON:
    SELECTED: 'selected'
    COMPLETED: 'completed'


  initialize: (options) ->
    @product = options.product
    @customization = new TR.Models.Customization()
    @customization.on 'change', @updateSummary
    @getTemplateFunction('customization_checkout', (template) =>
      @checkoutTemplateFunction = template
      @updateSummary()
    )
    $(document).on 'keydown.customization', @keydown
    
  keydown: (e) =>
    if e.which == 37 # Left arrow
      @advanceSlide 'prev'
    else if e.which == 39 # Right arrow
      @advanceSlide 'next'

  updateSummary: =>
    price = parseFloat(@product.get 'price') + if @customization.get 'vest' then TR.VEST_PRICE else 0
    summaryData = _.extend {price: price, vestPrice: TR.VEST_PRICE}, @customization.toJSON()
    @$('.customization-summary').html @checkoutTemplateFunction summaryData
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
    @resetChevrons()
    @updateChevron customizationType, @CHEVRON.SELECTED

    @getCurrentCustomization().hide()
    @$(".customization-wrapper[data-type=#{customizationType}]").show()
    
#    @getCurrentCustomization().fadeOut(=>
#      @$(".customization-wrapper[data-type=#{customizationType}]").fadeIn()
#    )

  selectLining: (e) ->
    e.preventDefault()
    @$('.lining-option').removeClass 'selected'
    $lining = $(e.currentTarget).addClass 'selected'
    @customization.set 'lining', $lining.data 'id'
    @updateChevron 'lining', @CHEVRON.COMPLETED

  clickedChevron: (e) ->
    e.preventDefault()
    @switchPane $(e.currentTarget).parent().data 'type'

  setMonogram: (e) ->
    @customization.set 'monogram', $(e.currentTarget).val()
    @updateChevron 'monogram', @CHEVRON.COMPLETED

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

    @updateChevron type, @CHEVRON.COMPLETED

    unless type == 'advanced'
      @customization.setByName type, option
      @clearChecked()
      $img.addClass 'checked'
    else
      $img.toggleClass 'checked'
      @customization.setByName option, $img.hasClass 'checked'

  updateChevron: (type, state) ->
    $chevron = @$(".chevrons li[data-type=#{type}] img")
    image = if state == 'selected' then 'chevron-selected.png' else 'chevron-completed.png'
    $chevron.attr('src', "assets/icons/#{image}").addClass state

  resetChevrons: ->
    $chevron = @$('.chevrons li').find 'img.selected'
    image = if $chevron.hasClass 'completed' then 'chevron-completed.png' else 'chevron.png';
    $chevron.attr('src', "assets/icons/#{image}").removeClass 'selected'

  addToCart: (e) ->
    e.preventDefault()
    @customization.save().then(=>
      $.post('/cart_items', {product_id: @product.get('id'), customization_id: @customization.get('id')}).then(
        @addSuccess, @addFailure
      )
    )
    
  addSuccess: (response) =>
    TR.Events.trigger 'addedToCart', {product: @product}

  addFailure: (error) =>
    console.log(error, 'failure');

  clearChecked: =>
    @$('a.customization-option:visible img').removeClass 'checked'
