class TR.Models.Customization extends TR.Models.Base
  defaults:
    lapel: 'notch'
    buttons: 2
    vents: 1
    pleats: 0
    pant_cuffs: false
    fit: 'tailored'
    lining: 0
    monogram: ''
    bouttoniere: true
    pick_stitching: false
    vest: false
    vest_buttons: 3

  url: ->
    super('/customizations')