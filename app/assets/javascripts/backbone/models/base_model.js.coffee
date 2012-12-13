class TR.Models.Base extends Backbone.Model
  # Allows setting of a variable name attribute
  setByName: (key, value, options) ->
    setter = {}
    setter[key] = value
    @.set setter, options
