# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  updateCaption = (data) ->
    $caption = $('#lookbook-info')
    _.each data, (value, attribute) ->
      $caption.find('.' + attribute).text(value)
    
  $('#slideshow').orbit
    timer: false
    afterSlideChange: (previous, current) ->
      $current = $(current)
      updateCaption $current.data()

  $('.page-down, #sidebar a, #continue').on 'click', (e) ->
    e.preventDefault()
    href = $(@).attr 'href'
    # The lookbook header is absolutely positioned so there is no height offset
    offset = unless href is '#lookbook' then TR.HEADER_HEIGHT else 0
    $('html, body').stop().animate
      scrollTop: $(href).offset().top - offset, 1000
    
  $(window).scroll ->
    $sidebar = $('#sidebar')
    $sidebar.find('li').removeClass('selected')

    pageTop = $(window).scrollTop()

    # Need to recalculate these every time just in case the browser width has changed
    processPosition = $('#process').offset().top
    topPicksPosition = $('#top-picks').offset().top
    bossesPosition = $('#bosses').offset().top
    aboutPosition = $('#about').offset().top
    lookbookPosition = $('#lookbook').offset().top

    # Parallax effect for transition image
    $('#bosses img').css 'top', (bossesPosition - pageTop - $(window).height()) / 2

    # Adding 100 to the page top so that we add the selected arrow slightly prematurely
    pageTop += 100
    if pageTop >= lookbookPosition
      $sidebar.find('.lookbook').addClass('selected')
    else if pageTop >= aboutPosition
      $sidebar.find('.about').addClass('selected')
    else if pageTop >= topPicksPosition
      $sidebar.find('.top-picks').addClass('selected')
    else if pageTop >= processPosition
      $sidebar.find('.process').addClass('selected')









