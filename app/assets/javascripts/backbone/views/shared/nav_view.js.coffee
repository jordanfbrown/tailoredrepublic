class TR.Views.Nav extends TR.Views.Base
  el: 'nav'

  initialize: (options) ->
    @user = options.user
    TR.Events.on 'removedLineItem', @decrementItemCount
    TR.Events.on 'addedLineItem', @incrementItemCount
    $(document).foundationTopBar();

  destroy: ->
    $(document).off 'click.header'
    super()

  decrementItemCount: =>
    @$('.num-items').text @getItemCount() - 1

  incrementItemCount: =>
    @$('.num-items').text @getItemCount() + 1

  getItemCount: ->
    parseInt @$('.num-items').text()