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

    pagePosition = $(window).scrollTop() + 100
    processPosition = $('#process').offset().top
    topPicksPosition = $('#top-picks').offset().top

    if pagePosition >= topPicksPosition
      $sidebar.find('.top-picks').addClass('selected')
    else if pagePosition >= processPosition
      $sidebar.find('.process').addClass('selected')







