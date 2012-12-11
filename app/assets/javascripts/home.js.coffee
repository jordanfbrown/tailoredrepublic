# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->

  $('.page-down, #sidebar a, #continue').on 'click', (e) ->
    e.preventDefault()
    href = $(@).attr 'href'
    $('html, body').stop().animate
      scrollTop: $(href).offset().top - TR.HEADER_HEIGHT, 1000
    
  $(window).scroll ->
    $sidebar = $('#sidebar')
    $sidebar.find('li').removeClass('selected')

    pageTop = $(window).scrollTop()
    processPosition = $('#process').offset().top
    topPicksPosition = $('#top-picks').offset().top
    bossesPosition = $('#bosses').offset().top
    aboutPosition = $('#about').offset().top

    # Parallax effect for transition image
    $('#bosses img').css 'top', (bossesPosition - pageTop - $(window).height()) / 2

    pageTop += 100
    if pageTop >= aboutPosition
      $sidebar.find('.about').addClass('selected')
    else if pageTop >= topPicksPosition
      $sidebar.find('.top-picks').addClass('selected')
    else if pageTop >= processPosition
      $sidebar.find('.process').addClass('selected')









