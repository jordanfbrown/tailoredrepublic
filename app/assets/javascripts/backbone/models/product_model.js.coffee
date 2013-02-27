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

  getCustomizationOptions: ->
    options = _.clone TR.CUSTOMIZATIONS[@get('category')].default
    categories = _.pluck options, 'category'
    if @get('subcategory') && (overrides = TR.CUSTOMIZATIONS[@get('category')][@get('subcategory')])
      for override in overrides
        if _.contains categories, override.category
          overrideIndex = _.indexOf categories, override.category
          options[overrideIndex] = override
        else
          options.unshift override
    options

