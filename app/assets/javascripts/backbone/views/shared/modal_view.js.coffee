class TR.Views.Modal extends TR.Views.Base

  className: ->
    'reveal-modal expand'

  events: ->
    'click a.close-reveal-modal': 'close'
    
  initialize: ->
    $(window).on 'resize.modal', @checkModalHeight

  render: ->
    $('body').append @$el
    @reveal()
    _.delay @checkModalHeight

  checkModalHeight: =>
    if @$el.height() < $(window).height() - 70
      unless $(window).scrollTop() > parseFloat @$el.css 'top'
        $('body').addClass 'modal-open'
    else
      $('body').removeClass 'modal-open'

  reveal: ->
    @$el.reveal
      closeOnBackgroundClick: false
      animation: 'fade'
      closed: =>
        @destroy()

  centerVertically: ->
    @$el.css 'top': $(document).scrollTop() + $(window).height() / 2, 'margin-top': -@$el.height() / 2

  destroy: ->
    $('body').removeClass 'modal-open'
    $(window).off 'resize.modal'
    super()

  close: ->
    @$el.trigger 'reveal:close'
    @destroy()
