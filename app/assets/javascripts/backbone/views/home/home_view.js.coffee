class TR.Views.Home extends TR.Views.Base
  el: '#main'

  events:
    'click .page-down': 'scrollToSection'

  initialize: (options) ->
    @createSlideshow()

    $(window).scroll @scroll
    $(window).resize @resize
    @resize true

    @products = new TR.Collections.Products options.products
    @products.each @renderProductView

    $('nav a').on 'click.home', @scrollToSection

  renderProductView: (product) =>
    @$('.suits-wrapper').append new TR.Views.Product({model: product}).render().el

  scrollToSection: (e) =>
    href = $(e.currentTarget).attr 'href'
    href = '/#home' if href == '/'
    # Ignore if there's no hash in the URL
    if !_.contains(href, '#') || href == '#'
      return true

    e.preventDefault()

    $home = $('#home');
    homeHeight = $home.height()
    marginBottom = parseFloat($home.css 'margin-bottom')

    href = href.substr 1, href.length

    if href == '#home'
      $('.parallax').css 'top', 0
      $('html, body').stop().animate
        scrollTop: 0, 1500, ->
          history.pushState href
    else
      # Lookbook has no padding on top so that the above texture extends to the very top of the lookbook
      offset = if href == '#lookbook' then -34 else 0
      $('html, body').stop().animate
        scrollTop: $(href).offset().top + offset, 1500, ->
          history.pushState href

  resize: (first) ->
    imgWidth = 1920
    imgHeight = 1280

    backgroundHeight = $(window).width() * imgHeight / imgWidth
    $('#process').css 'margin-top', backgroundHeight - $('nav').height()

    pageDownOffset = if backgroundHeight > $(window).height() then $(window).height() else backgroundHeight

    if first == true
      $('.page-down').animate
        'top': pageDownOffset - 78 + 'px', 750, ->
          $(this).animate 'top': pageDownOffset - 110, 100, ->
            $(this).animate 'top': pageDownOffset - 78, 100, ->
              $(this).animate 'top': pageDownOffset - 100, 100, ->
                $(this).animate 'top': pageDownOffset - 78, 100, ->
                  $(this).animate 'top': pageDownOffset - 90, 100, ->
                    $(this).animate 'top': pageDownOffset - 78, 100, ->
    else
      $('.page-down').css 'top', pageDownOffset - 78 + 'px'

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
    imgTop = (bossesPosition - pageTop - $(window).height()) / 3
    $('#bosses img').css 'top', imgTop

    # Check if background image is in view
    $home = $('#home')
    $backgroundImg = $home.find '.background'

    if $backgroundImg.inView().exists()
      homeTop = 0
      $('.page-down').show();
    else
      homeTop = -$backgroundImg.height()
      $('.page-down').hide();

    $home.find('.parallax').css 'top', homeTop + 'px'

  createSlideshow: ->
    @$('#slideshow').orbit
      afterSlideChange: (previous, current) =>
        @updateCaption $(current).data()
      resetTimerOnClick: on

  updateCaption: (data) ->
    $caption = $('#lookbook-info')
    $caption.fadeOut(->
      _.each data, (value, attribute) ->
        $caption.find('.' + attribute).text(value).css 'color', data.color
      $caption.fadeIn()
    )