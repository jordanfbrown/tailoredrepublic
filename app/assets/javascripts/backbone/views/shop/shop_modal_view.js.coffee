class TR.Views.ShopModal extends TR.Views.Base
  id: 'modal'

  className: 'reveal-modal expand'
  
  events: 
    'mousemove': 'mousemove'

  initialize: ->
    @templateFunction = Handlebars.compile $('#modal-template').html()

  render: ->
    @.$el.html @templateFunction() # Data will eventually get passed into this function
    @customizationView = new TR.Views.Customization el: @.$ '.customizations'
    @.enableMagnifier();
    @

  # This ensures that the magnifier is hidden when the mouse is no longer over the image
  mousemove: (e) ->
    $small = $('.small')
    offsetLeft = $small.offset().left
    offsetTop = $small.offset().top

    if (e.pageX < offsetLeft || e.pageX > offsetLeft + $small.width() ||
       e.pageY < offsetTop || e.pageY > offsetTop + $small.height()) && @.magnifierVisible()
      @.hideMagnifier()

  destroy: ->
    super()
    @customizationView.destroy()

  enableMagnifier: ->
    @.$('.magnify').magnifier();

  magnifierVisible: ->
    @.$('.large').is(':visible')

  hideMagnifier: ->
    @.$('.large').hide()

  reveal: ->
    @.$el.reveal
      closeOnBackgroundClick: false
      animation: 'none'
      closed: =>
        @.destroy()
