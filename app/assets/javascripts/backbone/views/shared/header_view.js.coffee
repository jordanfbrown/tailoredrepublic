class TR.Views.Header extends TR.Views.Base
  el: 'nav'

  events:
    'mouseenter li.shop': 'openShopDropdown'
    'mouseleave li.shop': 'closeShopDropdown'
    'click .shop-nav a': 'clickShopLink'

  initialize: ->
    $(document).on 'click.header', =>
      @$('.shop-nav').slideUp() if @$('.shop-nav').is(':visible')

  destroy: ->
    $(document).off 'click.header'
    super()

  clickShopLink: (e) ->
    e.stopPropagation()

  openShopDropdown: (e) ->
    e.preventDefault()
    e.stopPropagation()
    $shopNav = @$('.shop-nav')
    unless $shopNav.is(':visible') then $shopNav.slideDown()

  closeShopDropdown: (e) ->
    e.preventDefault()
    e.stopPropagation()
    $shopNav = @$('.shop-nav')
    if $shopNav.is(':visible') then $shopNav.slideUp()
