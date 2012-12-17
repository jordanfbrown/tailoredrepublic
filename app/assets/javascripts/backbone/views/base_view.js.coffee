class TR.Views.Base extends Backbone.View
  destroy: ->
    @.undelegateEvents()
    @.$el.removeData().unbind()
    @.remove()
    Backbone.View.prototype.remove.call @

  getTemplateFunction: (name, fn) ->
    if @templateFunction
      fn @templateFunction
    else
      $.get 'template', {name: name}, (template) =>
        @templateFunction = Handlebars.compile template
        fn @templateFunction


