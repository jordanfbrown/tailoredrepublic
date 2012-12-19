class TR.Views.Customization extends TR.Views.Base
  $checkmark: $('<span>&#x2713;</span>')

  events:
    'click a.customization-option': 'setCustomization'
    'click a.add-to-cart': 'addToCart'
    'click .chevron a': 'jumpToCustomization'
    'click a.left': 'previous'
    'click a.right': 'next'

  initialize: (options) ->
    @product = options.product
    @customization = new TR.Models.Customization()
    @customization.on 'change', @.updateSummary

    $(document).on 'keydown.customization', @.keydown
    
  keydown: (e) =>
    if e.which == 37 # Left arrow
      @.previous()
    else if e.which == 39 # Right arrow
      @.next()
      
  updateSummary: (model) =>
    console.log(@, model);

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


  jumpToCustomization: (e) ->
    e.preventDefault()
    @.switchPane $(e.currentTarget).parent().data 'type'

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
    @.clearCheckboxes()
    $(e.currentTarget).addClass('checked')
    .find('h5').append @.$checkmark

  addToCart: (e) ->
    e.preventDefault()
    @customization.save().then(=>
      $.post('/cart_items', {product_id: @product.get('id'), customization_id: @customization.get('id')}).then( (response) ->
        console.log(response);
      )
    )

  clearCheckboxes: =>
    @.$('a.customization-option:visible').removeClass('checked')
      .find('h5:visible span').remove()
