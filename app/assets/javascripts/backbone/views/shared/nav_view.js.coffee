class TR.Views.Nav extends TR.Views.Base
  el: 'nav'

  initialize: (options) ->
    @user = options.user
    TR.Events.on 'removedLineItem', @decrementItemCount
    TR.Events.on 'addedLineItem', @incrementItemCount
    $(document).foundationTopBar();
    $(window).resize @resize

  destroy: ->
    TR.Events.off 'removedLineItem'
    TR.Events.off 'addedLineItem'
    super()

  resize: =>
    if $(window).width() > 971
      $('ul.dropdown').css 'height', 'inherit'

  decrementItemCount: =>
    @$('.num-items').text @getItemCount() - 1

  incrementItemCount: =>
    @$('.num-items').text @getItemCount() + 1

  getItemCount: ->
    parseInt @$('.num-items').text()