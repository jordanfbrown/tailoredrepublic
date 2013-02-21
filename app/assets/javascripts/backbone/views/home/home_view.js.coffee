class TR.Views.Home extends TR.Views.Base
  el: '#main'

  events:
    'click .page-down': 'scrollToSection'
    'click .product-wrapper a': 'renderProductModal'

  initialize: (options) ->
    @cacheSelectors()
    @products = new TR.Collections.Products options.products
    TR.createSlideshow()
    $(document).foundationMagellan
      threshold: 100
    $(window).scroll @scroll
    $(window).resize @resize
    @resize true
    $('nav a').on 'click.home', @scrollToSection

    if window.location.hash == '#lookbook'
      _.delay ->
        $('nav .lookbook a').click()
      , 500
    
    @els.constitutionImage.load =>
      @adjustConstitutionImage $(window).width()

  renderProductModal: (e) =>
    e.preventDefault()
    id = $(e.currentTarget).parents('.product-wrapper').data 'id'
    product = @products.get id
    TR.Analytics.trackEvent 'Top Picks', 'View', product.get('name')
    @productModal = new TR.Views.ProductModal({model: product})

  scrollToSection: (e) =>
    href = $(e.currentTarget).attr 'href'
    href = '/#home' if href == '/'
    # Ignore if there's no hash in the URL
    if !_.contains(href, '#') || href == '#'
      return true

    e.preventDefault()
    TR.Events.trigger 'closeModal'

    $home = $('#home');
    homeHeight = $home.height()
    marginBottom = parseFloat($home.css 'margin-bottom')

    href = href.substr 1, href.length

    if href == '#home'
      $('.parallax').css 'top', 0
      $('html, body').stop().animate
        scrollTop: 0, 1500, ->
          history.pushState {href: href}, 'Custom Tailored Suits | Tailored Republic', href
    else
      # Lookbook has no padding on top so that the above texture extends to the very top of the lookbook
      offset = if href == '#lookbook' then -34 else 0
      $('html, body').stop().animate
        scrollTop: $(href).offset().top + offset, 1500, ->
        history.pushState {href: href}, 'Custom Tailored Suits | Tailored Republic', href
        
  cacheSelectors: ->
    @els =
      pageDown: $('.page-down')
      constitution: $('#constitution')
      constitutionImage: $('#constitution img')
      constitutionParent: $('#constitution .four')
      process: $('#process')
      topPicks: $('#top-picks')
      bosses: $('#bosses')
      bossesImage: $('#bosses img')
      about: $('#about')
      aboutImage: $('#about img')
      lookbook: $('#lookbook')
      home: $('#home')
      nav: $('nav')

  resize: (shouldAnimate) =>
    imgWidth = 1920
    imgHeight = 1280

    windowWidth = $(window).width()
    windowHeight = $(window).height()
    backgroundHeight = windowWidth * imgHeight / imgWidth
    pageDownOffset = if backgroundHeight > windowHeight then windowHeight else backgroundHeight

    @animatePageDown(shouldAnimate, pageDownOffset)
    @adjustProcess(backgroundHeight)
    @adjustConstitutionImage(windowWidth)

  adjustProcess: (backgroundHeight) ->
    @els.process.css 'margin-top', backgroundHeight - @els.nav.height()

  animatePageDown: (shouldAnimate, pageDownOffset) ->
    restingPosition = 108
    if shouldAnimate == true
      @els.pageDown.animate
        'top': pageDownOffset - restingPosition, 750, =>
          @els.pageDown.animate 'top': pageDownOffset - 140, 100, =>
            @els.pageDown.animate 'top': pageDownOffset - restingPosition, 100, =>
              @els.pageDown.animate 'top': pageDownOffset - 130, 100, =>
                @els.pageDown.animate 'top': pageDownOffset - restingPosition, 100, =>
                  @els.pageDown.animate 'top': pageDownOffset - 120, 100, =>
                    @els.pageDown.animate 'top': pageDownOffset - restingPosition, 100
    else
      @els.pageDown.css 'top', pageDownOffset - restingPosition + 'px'

  adjustConstitutionImage: (windowWidth) ->
    if windowWidth > 768
      constitutionTop = (@els.constitution.height() - @els.constitutionImage.height()) / 2
      constitutionRight = (@els.constitutionParent.width() - @els.constitutionImage.width()) / 2
      @els.constitutionImage.css 'top': constitutionTop, right: constitutionRight
    else
      @els.constitutionImage.css 'top': 0, right: 0

  scroll: =>
    # Need to recalculate these every time just in case the browser width has changed
    pageTop = $(window).scrollTop()
    bossesPosition = @els.bosses.offset().top
    aboutPosition = @els.about.offset().top

    # Parallax effect for transition image
    if $(window).width() > 767
      bossImgTop = (bossesPosition - pageTop - $(window).height()) / 3
      if @els.bossesImage.height() + bossImgTop + 34 > 400
        @els.bossesImage.css 'top', bossImgTop
      aboutImgRight = -(aboutPosition - pageTop - $(window).height() + 600) / 5
      @els.aboutImage.css 'right': aboutImgRight, top: '-60px'
    else
      @els.bossesImage.css 'top', 0
      @els.aboutImage.css 'top': '-30px', right: '0px'

    # Check if background image is in view
    $backgroundImg = @els.home.find '.background'

    if $backgroundImg.inView().exists()
      homeTop = 0
      @els.pageDown.show();
    else
      homeTop = -$backgroundImg.height()
      @els.pageDown.hide();

    @els.home.find('.parallax').css 'top', homeTop + 'px'