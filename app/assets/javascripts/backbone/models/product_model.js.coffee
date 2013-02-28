class TR.Models.Product extends TR.Models.Base
  url: ->
    super('/products')

  isCustomFabric: ->
    @get('category') == 'suit' && @get('name') == 'Build Your Own Suit'

  isCustomizable: ->
    @get('category') == 'suit' || @get('category') == 'shirt'
    
  defaultProductImage: ->
    _.find @get('product_images'), (image) ->
      image.default

  getProductImageById: (id) ->
    _.find @get('product_images'), (image) ->
      image.id == id

  getCustomizationOptions: (existingCustomization) ->
    options = _.clone TR.CUSTOMIZATIONS[@get('category')].default
    categories = _.pluck options, 'category'
    if @get('subcategory') && (overrides = TR.CUSTOMIZATIONS[@get('category')][@get('subcategory')])
      for override in overrides
        if _.contains categories, override.category
          overrideIndex = _.indexOf categories, override.category
          options[overrideIndex] = override
        else
          options.unshift override

    @setSelected options, existingCustomization
    options

  setSelected: (options, existingCustomization) ->
    for customizationOption in options
      category = customizationOption.category
      for option, value of customizationOption.options
        if existingCustomization
          value.selected = existingCustomization.get(category).toString() == option.toString()
        else
          value.selected = value.default
