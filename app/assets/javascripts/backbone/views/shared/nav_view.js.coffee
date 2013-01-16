class TR.Views.Nav extends TR.Views.Base
  el: 'nav'

  initialize: (options) ->
    @user = options.user
    TR.Events.on 'removedLineItem', @decrementItemCount
    TR.Events.on 'addedLineItem', @incrementItemCount
    $(document).foundationTopBar();
    $(window).resize @resize

  destroy: ->
    $(document).off 'click.header'
    super()

  resize: =>
    if $(window).width() > 932
      $('ul.dropdown').css 'height', 'inherit'

  decrementItemCount: =>
    @$('.num-items').text @getItemCount() - 1

  incrementItemCount: =>
    @$('.num-items').text @getItemCount() + 1

  getItemCount: ->
    parseInt @$('.num-items').text()