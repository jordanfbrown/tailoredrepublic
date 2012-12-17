class TR.Views.Customization extends TR.Views.Base
  $checkmark: $('<span>&#x2713;</span>')

  events:
    'click a.customization-option': 'setCustomization'
    'click a.add-to-cart': 'addToCart'

  initialize: (options) ->
    @product = options.product
    @customization = new TR.Models.Customization()
    $(document).on 'keydown.customization', @.keydown
    
  keydown: (e) =>
    if e.which == 37 # Left arrow
      @.previous()
    else if e.which == 39 # Right arrow
      @.next()

  previous: ->
    $currentCustomization = @.$('.customization-wrapper:visible')
    $previousCustomization = $currentCustomization.prev()
    if $previousCustomization.exists()
#      $currentCustomization.fadeOut ->
#        $currentCustomization.prev().fadeIn()
      $currentCustomization.hide().prev().show()

  next: ->
    $currentCustomization = @.$('.customization-wrapper:visible')
    $nextCustomization = $currentCustomization.next();
    if $nextCustomization.exists()
#      $currentCustomization.fadeOut ->
#        $currentCustomization.next().fadeIn()
      $currentCustomization.hide().next().show()

  destroy: ->
    super()
    $(document).off 'keydown.customization'

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
