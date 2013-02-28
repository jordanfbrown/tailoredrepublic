class TR.Models.Customization extends TR.Models.Base

  initialize: (attributes, options) ->
    @product = options.product if options

    # Only gets called when instantiating a new instance
    if @product
      customizationOptions = @product.getCustomizationOptions()
      defaults = @getDefaults customizationOptions
      @attributes = _.extend {
        product_category: @product.get('category'),
        monogram: ''
      }, defaults, attributes

  url: ->
    super('/customizations')

  getDefaults: (customizationOptions) ->
    defaults = {}
    for customizationOption in customizationOptions
      category = customizationOption.category
      for option, value of customizationOption.options
        option = @parseOption option
        defaults[category] = option if value.default
    defaults

  # Turns "true" or "false" into booleans, "1", "2", "3", etc. into 1, 2, 3, and leaves strings intact
  parseOption: (option) ->
    if option == 'true' || option == 'false'
      !!option
    else if !_.isNaN(parseInt option)
      parseInt option
    else
      option

  hasShirtMonogram: ->
    @get('monogram').length > 0 && @get('product_category') == 'shirt'