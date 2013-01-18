class TR.Models.Customization extends TR.Models.Base
  initialize: (attributes, options) ->
    @productCategory = options.category

    if @productCategory == 'suit'
      @attributes = _.extend {}, {
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
      }, attributes
    else if @productCategory == 'shirt'
      @attributes = _.extend {}, {
        collar: 'standard'
        fit: 'slim'
        pocket: false
        monogram: ''
        monogram_color: 'white'
      }, attributes


  url: ->
    super('/customizations')