class TR.Models.Customization extends TR.Models.Base
  defaults:
    lapel: 'notch'
    buttons: '2'
    vents: '2'
    pleats: false
    pantCuffs: false
    fit: 'tailored'
    lining: 0
    monogram: ''
    bouttoniere: false
    pickStitching: false

  url: ->
    url = '/customizations'
    unless @.isNew()
      url += '/' + @.get('id')
    url