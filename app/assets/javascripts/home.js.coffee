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

    $process = $('#process')
    processPosition = $process.offset().top
    
    if pagePosition >= processPosition
      $sidebar.find('.process').addClass('selected')






