class TR.Views.Customization extends TR.Views.Base
  $checkmark: $('<span>&#x2713;</span>')

  events:
    'click a.customization-option': 'setCustomization'
    'click a.add-to-cart': 'addToCart'
    'click .chevron a': 'clickedChevron'
    'click a.left': 'previous'
    'click a.right': 'next'
    'click a.lining-option': 'selectLining'
    'keyup input[name=monogram]': 'keyupMonogram'

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
    @.$('.customization-summary').html @checkoutTemplateFunction @customization.toJSON()

  previous: (e) ->
    e.preventDefault() if e
    $currentCustomization = @.getCurrentCustomization()
    $previousCustomization = $currentCustomization.prev('.customization-wrapper')
    if $previousCustomization.exists()
      @.switchPane $currentCustomization.prev().data 'type'

  next: (e) ->
    e.preventDefault() if e
    $currentCustomization = @.getCurrentCustomization()
    $nextCustomization = $currentCustomization.next('.customization-wrapper');
    if $nextCustomization.exists()
      @.switchPane $currentCustomization.next().data 'type'

  switchPane: (customizationType) ->
    @.$('.chevron').find('img.selected').attr('src', 'assets/icons/chevron.png').removeClass 'selected'
    @.$(".chevron[data-type=#{customizationType}] img").attr('src', 'assets/icons/chevron-selected.png').addClass 'selected'

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

  keyupMonogram: (e) ->
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
    @customization.setByName type, option
    
    # Update view
    @.clearChecked()
    $(e.currentTarget).addClass('checked')

  addToCart: (e) ->
    e.preventDefault()
    @customization.save().then(=>
      $.post('/cart_items', {product_id: @product.get('id'), customization_id: @customization.get('id')}).then( (response) ->
        console.log(response);
      )
    )

  clearChecked: =>
    @.$('a.customization-option:visible').removeClass('checked')
