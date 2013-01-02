class TR.Views.Header extends TR.Views.Base
  el: 'nav'

  events:
    'click a.toggle-shop': 'toggleShopDropdown'
    'click .shop-nav a': 'clickShopLink'

  initialize: ->
    $(document).on 'click.header', =>
      @$('.shop-nav').slideUp() if @$('.shop-nav').is(':visible')

  destroy: ->
    $(document).off 'click.header'
    super()

  clickShopLink: (e) ->
    e.stopPropagation()

  toggleShopDropdown: (e) ->
    e.preventDefault()
    e.stopPropagation()
    $shopNav = @$('.shop-nav')
    if $shopNav.is(':visible') then $shopNav.slideUp() else $shopNav.slideDown()
