class TR.Views.Customization extends TR.Views.Base
  $checkmark: $('<span>&#x2713;</span>')

  customizationOrder: [
    'lapel'
    'buttons'
    'vents'
    'pleats'
    'pantCuffs'
    'fit'
    'lining'
    'monogram'
    'bouttoniere'
  ]

  events:
    'click a.customization-option': 'setCustomization'

  initialize: ->
    @model = new TR.Models.Customizations()
    @current = 0
    $(document).on 'keydown.customization', @.keydown
    
  keydown: (e) =>
    if e.which == 37 # Left arrow
      @.slideLeft()
    else if e.which == 39 # Right arrow
      @.slideRight()
      
  slideLeft: ->
    @current-- unless @current == 0

  slideRight: ->
    @current++ unless @current >= @customizationOrder.length - 1

  destroy: ->
    super()
    $(document).off 'keydown.customization'

  setCustomization: (e) =>
    e.preventDefault()

    # Update model
    $target = $(e.currentTarget)
    option = $target.data 'option'
    @model.setByName @customizationOrder[@current], option

    # Update view
    @.clearCheckboxes()
    $(e.currentTarget).addClass('checked')
    .find('h5').append @.$checkmark

  clearCheckboxes: =>
    @.$('a.customization-option:visible').removeClass('checked').end()
      .find('h5:visible span').remove()
