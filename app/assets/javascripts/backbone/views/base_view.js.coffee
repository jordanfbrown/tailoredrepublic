class TR.Views.Base extends Backbone.View

  destroy: ->
    @undelegateEvents()
    @$el.removeData().unbind()
    @remove()
    Backbone.View.prototype.remove.call @

  getTemplate: (name) ->
    Handlebars.templates["_#{name}.hbs"]
