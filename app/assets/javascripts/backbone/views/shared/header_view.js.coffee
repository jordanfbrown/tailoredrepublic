class TR.Views.Header extends TR.Views.Base
  el: 'nav'

  events:
    'mouseenter li.shop': 'openShopDropdown'
    'mouseleave li.shop': 'closeShopDropdown'
    'mouseleave li.home': 'closeHomeDropdown'
    'mouseenter li.home': 'openHomeDropdown'
    'mouseleave a.username': 'closeUserDropdown'
    'mouseenter a.username': 'openUserDropdown'

  initialize: (options) ->
    @user = options.user
    TR.Events.on 'removedCartItem', @decrementItemCount
    TR.Events.on 'addedCartItem', @incrementItemCount

  destroy: ->
    $(document).off 'click.header'
    super()

  decrementItemCount: =>
    @$('.num-items').text @getItemCount() - 1

  incrementItemCount: =>
    @$('.num-items').text @getItemCount() + 1

  getItemCount: ->
    parseInt @$('.num-items').text()

  openHomeDropdown: (e) ->
    if $(window).width() < 856
      $homeNav = @$('.home-nav')
      unless $homeNav.is(':visible') then $homeNav.slideDown()

  closeHomeDropdown: (e) ->
    if $(window).width() < 856
      $homeNav = @$('.home-nav')
      if $homeNav.is(':visible') then $homeNav.slideUp()

  openShopDropdown: (e) ->
    $shopNav = @$('.shop-nav')
    unless $shopNav.is(':visible') then $shopNav.slideDown()

  closeShopDropdown: (e) ->
    $shopNav = @$('.shop-nav')
    if $shopNav.is(':visible') then $shopNav.slideUp()

  openUserDropdown: (e) ->
    $userNav = @$('.user-nav')
    unless $userNav.is(':visible') then $userNav.slideDown()

  closeUserDropdown: (e) ->
    $userNav = @$('.user-nav')
    if $userNav.is(':visible') then $userNav.slideUp()