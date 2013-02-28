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

  # Returns the customization options for the category of the product as an array of objects
  # If a subcategory has an option defined that exists in the default array of options, it will overwrite the default
  # If a subcategory has an option that is not defined in the default array, it will get added to the front of the array
  getCustomizationOptions: (existingCustomization) ->
    options = TR.CUSTOMIZATIONS[@get('category')].default.slice(0)
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

  # Adds a new key, selected, to the array of customization option objects
  # For new customizations, the value of selected is the same as the default
  # For existing customizations, the value is set to whatever value was stored in the customization
  setSelected: (options, existingCustomization) ->
    for customizationOption in options
      category = customizationOption.category
      for option, value of customizationOption.options
        if existingCustomization
          value.selected = existingCustomization.get(category).toString() == option.toString()
        else
          value.selected = value.default
