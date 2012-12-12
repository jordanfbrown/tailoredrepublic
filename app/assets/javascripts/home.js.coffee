TR.Pages.Home =
  initialize: ->
    $('#slideshow').orbit
      timer: false
      afterSlideChange: (previous, current) =>
        @.updateCaption $(current).data()

    $('.page-down, #sidebar a, #continue').on 'click', (e) ->
      href = $(@).attr 'href'

      # Ignore if there's no hash in the URL
      unless _.contains href, '#'
        return true

      e.preventDefault()
      # The lookbook header is absolutely positioned so there is no height offset
      offset = unless href is '#lookbook' then TR.HEADER_HEIGHT else 0
      $('html, body').stop().animate
        scrollTop: $(href).offset().top - offset, 1000

    $(window).scroll @.scroll

    # Triggers for responsive font scaling
#    $(window).resize @.resize
    @.resize()

  updateCaption: (data) ->
    $caption = $('#lookbook-info')
    $caption.fadeOut(->
      _.each data, (value, attribute) ->
        $caption.find('.' + attribute).text(value)
      $caption.fadeIn()
    )

  resize: ->
    # 70 seems to be the "magic" font resize ratio
    resizeRatio = 80
    width = $(window).width()
    fontSize = if width > 767 then width / resizeRatio + 'px' else '20px';
    if width > 1200
      base = 20

    $('.suit-price span').css 'font-size', fontSize

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













