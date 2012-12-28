class TR.Views.Modal extends TR.Views.Base

  className: 'reveal-modal expand'

  events: ->
    'click a.close-reveal-modal': 'close'

  render: ->
    $('body').append @$el
    @$el.css 'margin-top', -(@$el.height() / 2)
    @reveal()

  reveal: ->
    @$el.reveal
      closeOnBackgroundClick: false
      animation: 'fade'
      closed: =>
        @destroy()

  close: ->
    @$el.trigger 'reveal:close'
    @destroy()
