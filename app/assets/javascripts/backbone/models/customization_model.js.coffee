class TR.Models.Customization extends TR.Models.Base

  initialize: (attributes, options) ->
    @product = options.product if options

    # Only gets called when instantiating a new instance
    if @product
      customizationOptions = @product.getCustomizationOptions()
      defaults = @getDefaults customizationOptions
      @attributes = _.extend {
        monogram: ''
      }, defaults, attributes

  url: ->
    super('/customizations')

  # Iterates through the customization options for a product and returns an object containing categories and their
  # default values
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
      option == 'true'
    else if !_.isNaN(parseInt option)
      parseInt option
    else
      option

  hasShirtMonogram: ->
    @get('monogram').length > 0 && @product.get('category') == 'shirt'