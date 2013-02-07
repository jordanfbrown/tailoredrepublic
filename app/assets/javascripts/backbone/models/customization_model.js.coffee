class TR.Models.Customization extends TR.Models.Base
  initialize: (attributes, options) ->
    @productCategory = options.category if options
    customFabric = options.customFabric if options

    if @productCategory
      if @productCategory == 'suit'
        @attributes = _.extend {}, {
          lapel: 'notch'
          buttons: 2
          vents: 2
          pleats: 0
          pant_cuffs: false
          fit: 'tailored'
          lining: 0
          monogram: ''
          pick_stitching: false
          vest: 0
          product_category: @productCategory
          fabric: 'charcoal-pinstripe' if customFabric
        }, attributes
      else if @productCategory == 'shirt'
        @attributes = _.extend {}, {
          collar: 'standard'
          fit: 'slim'
          pocket: false
          monogram: ''
          monogram_color: 'white'
          product_category: @productCategory
        }, attributes


  url: ->
    super('/customizations')

  hasShirtMonogram: ->
    @get('monogram').length > 0 && @get('product_category') == 'shirt'