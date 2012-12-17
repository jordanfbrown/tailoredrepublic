class TR.Views.Home extends TR.Views.Base
  el: '#main'

  events:
    'click .page-down, #sidebar a, #continue': 'scrollToSection',
    'click .product-wrapper a': 'renderProductModal'

  initialize: ->
    @.createSlideshow()
    $(window).scroll @.scroll

  scrollToSection: (e) =>
    href = $(e.currentTarget).attr 'href'
    # Ignore if there's no hash in the URL
    unless _.contains href, '#'
      return true

    e.preventDefault()
    
    $('html, body').stop().animate
      scrollTop: $(href).offset().top, 1000

  scroll: ->
    $sidebar = $('#sidebar')
    $sidebar.removeClass('bottom').find('li').removeClass('selected')

    # Need to recalculate these every time just in case the browser width has changed
    pageTop = $(window).scrollTop()
    processPosition = $('#process').offset().top
    topPicksPosition = $('#top-picks').offset().top
    bossesPosition = $('#bosses').offset().top
    aboutPosition = $('#about').offset().top
    lookbookPosition = $('#lookbook').offset().top
    infoPosition = $('#info').offset().top

    # Parallax effect for transition image
    $('#bosses img').css 'top', (bossesPosition - pageTop - $(window).height()) / 2

    # Adding 100 to the page top so that we add the selected arrow slightly prematurely
    pageTop += 100
    if $(window).scrollBottom() <= 230
      $sidebar.find('.info').addClass('selected')
      $sidebar.addClass('bottom')
    else if pageTop + 55 >= aboutPosition
      $sidebar.find('.about').addClass('selected')
    else if pageTop >= topPicksPosition
      $sidebar.find('.top-picks').addClass('selected')
    else if pageTop >= processPosition
      $sidebar.find('.process').addClass('selected')

  createSlideshow: ->
    @.$('#slideshow').orbit
      afterSlideChange: (previous, current) =>
        @.updateCaption $(current).data()

  updateCaption: (data) ->
    $caption = $('#lookbook-info')
    $caption.fadeOut(->
      _.each data, (value, attribute) ->
        $caption.find('.' + attribute).text(value)
      $caption.fadeIn()
    )

  renderProductModal: ->
    @productModal = new TR.Views.ProductModal().render()
    @productModal.$el.insertAfter('#sidebar')
    @productModal.reveal()