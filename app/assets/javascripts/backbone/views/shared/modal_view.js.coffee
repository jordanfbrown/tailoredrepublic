class TR.Views.Modal extends TR.Views.Base

  className: 'reveal-modal expand'

  events: ->
    'click a.close-reveal-modal': 'close'

  close: ->
    @.$el.trigger 'reveal:close'
    @.destroy()
