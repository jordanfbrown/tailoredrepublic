class TR.Views.Customization extends TR.Views.Base
  $checkmark: ('<span>&#x2713;</span>')

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
    'click a.customization-wrapper': 'setCustomization'

  initialize: ->
    @model = new TR.Models.Customizations()
    @current = @customizationOrder[0]
    $(document).on 'keydown.customization', @.keydown
    
  keydown: (e) =>
    if e.which == 37 # Left arrow
      true
    else if e.which == 39 # Right arrow
      true

  destroy: ->
    super()
    $(document).off 'keydown.customization'

  setCustomization: (e) =>
    e.preventDefault()

    # Update model
    $target = $(e.currentTarget)
    option = $target.data 'option'
    @model.setByName @current, option

    # Update view
    @.clearCheckboxes()
    $(e.currentTarget).addClass('checked')
    .find('h5').append @.$checkmark

  clearCheckboxes: =>
    @.$('a.customization-wrapper:visible').removeClass('checked').end()
      .find('h5:visible span').remove()
