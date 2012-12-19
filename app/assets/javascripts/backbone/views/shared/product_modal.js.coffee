class TR.Views.ProductModal extends TR.Views.Base
  id: 'modal'

  className: 'reveal-modal expand'
  
  events: 
    'mousemove': 'mousemove'
    'click a.close-reveal-modal': 'close'

  initialize: () ->
    @.getTemplateFunction('product_modal', (templateFunction) =>
      @templateFunction = templateFunction
      @.render()
    )

  render: ->
    @.$el.html @templateFunction @model.toJSON()
    @customizationView = new TR.Views.Customization el: @.$('.customizations'), product: @model
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

  close: ->
    @.$el.trigger 'reveal:close'
    @.destroy()

  enableMagnifier: ->
    @.$('.magnify').magnifier();

  magnifierVisible: ->
    @.$('.large').is(':visible')

  hideMagnifier: ->
    @.$('.large').hide()

  reveal: ->
    @.$el.reveal
      closeOnBackgroundClick: false
      animation: 'fade'
      closed: =>
        @.destroy()
