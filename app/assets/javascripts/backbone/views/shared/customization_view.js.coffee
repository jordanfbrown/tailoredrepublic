class TR.Views.Customization extends TR.Views.Base
  $checkmark: $('<span>&#x2713;</span>')

  VEST_PRICE: 79

  events:
    'click a.customization-option': 'setCustomization'
    'click a.add-to-cart': 'addToCart'
    'click ul.chevrons a': 'clickedChevron'
    'click a.left': 'previous'
    'click a.right': 'next'
    'click a.lining-option': 'selectLining'
    'blur input[name=monogram]': 'setMonogram'

  initialize: (options) ->
    @product = options.product
    @customization = new TR.Models.Customization()
    @customization.on 'change', @.updateSummary
    @.getTemplateFunction('customization_checkout', (template) =>
      @checkoutTemplateFunction = template
      @.updateSummary()
    )

    $(document).on 'keydown.customization', @.keydown
    
  keydown: (e) =>
    if e.which == 37 # Left arrow
      @.previous()
    else if e.which == 39 # Right arrow
      @.next()

  updateSummary: =>
    price = parseFloat(@product.get 'price') + if @customization.get 'vest' then @.VEST_PRICE else 0
    summaryData = _.extend {price: price, vestPrice: @.VEST_PRICE}, @customization.toJSON()
    @.$('.customization-summary').html @checkoutTemplateFunction summaryData

    @.$('.vest-overlay').toggle !@.customization.get 'vest'

  previous: (e) ->
    e.preventDefault() if e
    @.advanceSlide 'prev'

  next: (e) ->
    e.preventDefault() if e
    @.advanceSlide 'next'

  advanceSlide: (direction) ->
    $currentCustomization = @.getCurrentCustomization()
    $previousOrNext = $currentCustomization[direction] '.customization-wrapper'

    # Skip over the vest button slide if user selected "No vest"
    vestSlide = if direction == 'prev' then 'checkout' else 'vest'
    if $currentCustomization.data('type') == vestSlide && !@customization.get 'vest'
      $previousOrNext = $previousOrNext[direction] '.customization-wrapper'

    if $previousOrNext.exists()
      @.switchPane $previousOrNext.data 'type'

  switchPane: (customizationType) ->
    @.$('.chevrons li').find('img.selected').attr('src', 'assets/icons/chevron.png').removeClass 'selected'
    @.$(".chevrons li[data-type=#{customizationType}] img").attr('src', 'assets/icons/chevron-selected.png').addClass 'selected'

    @.getCurrentCustomization().hide()
    @.$(".customization-wrapper[data-type=#{customizationType}]").show()
    
#    @.getCurrentCustomization().fadeOut(=>
#      @.$(".customization-wrapper[data-type=#{customizationType}]").fadeIn()
#    )

  selectLining: (e) ->
    e.preventDefault()
    @.$('.lining-option').removeClass 'selected'
    $lining = $(e.currentTarget).addClass 'selected'
    @customization.set 'lining', $lining.data 'id'

  clickedChevron: (e) ->
    e.preventDefault()
    @.switchPane $(e.currentTarget).parent().data 'type'

  setMonogram: (e) ->
    @customization.set 'monogram', $(e.currentTarget).val()

  destroy: ->
    super()
    $(document).off 'keydown.customization'

  getCurrentCustomization: ->
    @.$('.customization-wrapper:visible')

  setCustomization: (e) =>
    e.preventDefault()

    # Update model
    $target = $(e.currentTarget)
    option = $target.data 'option'
    type = $target.parents('.customization-wrapper').data 'type'

    unless type == 'advanced'
      @customization.setByName type, option
      @.clearChecked()
      $(e.currentTarget).addClass 'checked'
    else
      $target.toggleClass 'checked'
      @customization.setByName option, $target.hasClass 'checked'

  addToCart: (e) ->
    e.preventDefault()
    @customization.save().then(=>
      $.post('/cart_items', {product_id: @product.get('id'), customization_id: @customization.get('id')}).then( (response) ->
        console.log(response);
      )
    )

  clearChecked: =>
    @.$('a.customization-option:visible').removeClass 'checked'
