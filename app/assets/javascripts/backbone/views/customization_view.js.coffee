class TR.Views.Customization extends TR.Views.Base
  el: '.customizations'
  events:
    'click a.customization-wrapper': 'setChecked'

  initialize: ->
    @model = new TR.Models.Customization() 

  setChecked: (e) =>
    e.preventDefault()
    @.clearCheckboxes()
    $(e.currentTarget).addClass('checked')
      .find('h5').append('<span>&#x2713;</span>')

  clearCheckboxes: =>
    @.$('a.customization-wrapper:visible').removeClass('checked').end()
      .find('h5:visible span').remove()
