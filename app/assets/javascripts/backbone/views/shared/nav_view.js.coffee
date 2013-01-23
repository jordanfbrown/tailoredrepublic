class TR.Views.Nav extends TR.Views.Base
  el: 'nav'

  initialize: (options) ->
    @user = options.user
    TR.Events.on 'removedLineItem', @decrementItemCount
    TR.Events.on 'addedLineItem', @incrementItemCount
    $(document).foundationTopBar();
    $(window).resize @resize

  events:
    'click .has-dropdown': 'toggleDropdown'

  destroy: ->
    TR.Events.off 'removedLineItem'
    TR.Events.off 'addedLineItem'
    super()

  resize: =>
    if $(window).width() > 865
      $('ul.dropdown').css 'height', 'inherit'

  toggleDropdown: (e) ->
    e.preventDefault()
    $(e.currentTarget).find('.dropdown').toggle()

  decrementItemCount: =>
    @$('.num-items').text @getItemCount() - 1

  incrementItemCount: =>
    @$('.num-items').text @getItemCount() + 1

  getItemCount: ->
    parseInt @$('.num-items').text()