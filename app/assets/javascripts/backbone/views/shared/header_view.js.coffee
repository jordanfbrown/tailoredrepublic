class TR.Views.Header extends TR.Views.Base
  el: 'nav'

  events:
    'mouseenter li.shop': 'openShopDropdown'
    'mouseleave li.shop': 'closeShopDropdown'
    'click .shop-nav a': 'clickShopLink'

  initialize: ->
    $(document).on 'click.header', =>
      @$('.shop-nav').slideUp() if @$('.shop-nav').is(':visible')

    TR.Events.on 'removedCartItem', @decrementItemCount
    TR.Events.on 'addedCartItem', @incrementItemCount

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

  decrementItemCount: =>
    @$('.num-items').text @getItemCount() - 1

  incrementItemCount: =>
    @$('.num-items').text @getItemCount() + 1

  getItemCount: ->
    parseInt @$('.num-items').text()

  closeShopDropdown: (e) ->
    e.preventDefault()
    e.stopPropagation()
    $shopNav = @$('.shop-nav')
    if $shopNav.is(':visible') then $shopNav.slideUp()
