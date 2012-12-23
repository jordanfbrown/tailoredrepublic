class TR.Views.Home extends TR.Views.Base
  el: '#main'

  events:
    'click .page-down, #sidebar a, #continue': 'scrollToSection',
    'click .product-wrapper a': 'renderProductModal'

  initialize: ->
    @.createSlideshow()
    $(window).scroll @.scroll
    $(window).resize @.resize
    @.resize()
    @footerView = new TR.Views.Footer()

  scrollToSection: (e) =>
    href = $(e.currentTarget).attr 'href'
    # Ignore if there's no hash in the URL
    unless _.contains href, '#'
      return true

    e.preventDefault()

    $home = $('#home');
    homeHeight = $home.height()
    marginBottom = parseFloat($home.css 'margin-bottom')
    adjustment = false
#    if $(window).scrollTop() < homeHeight + marginBottom
#      adjustment = homeHeight - homeHeight / 2.5 + Math.abs $('#process').offset().top - $(href).offset().top

    $('html, body').stop().animate
      scrollTop: (if adjustment then adjustment else $(href).offset().top), 1500

  resize: (e) ->
    imgWidth = 1920
    imgHeight = 1280

    backgroundHeight = $(window).width() * imgHeight / imgWidth;
    $('#process').css 'margin-top', backgroundHeight
    
    pageDownOffset = if backgroundHeight > $(window).height() then $(window).height() else backgroundHeight
    $('.page-down').css 'top', pageDownOffset - 70 + 'px'

  scroll: (e) ->
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