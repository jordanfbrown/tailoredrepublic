class TR.Models.Base extends Backbone.Model
  # Allows setting of a variable name attribute
  setByName: (key, value, options) ->
    setter = {}
    setter[key] = value
    @set setter, options

  url: (url) ->
    unless @isNew()
      url += '/' + @get('id')
    url

  hasDefaultAttributes: ->
    _.all @defaults, (value, name) =>
      @attributes[name] == value
      
