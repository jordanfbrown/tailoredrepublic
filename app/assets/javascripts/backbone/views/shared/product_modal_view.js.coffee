class TR.Views.ProductModal extends TR.Views.Modal

  events: ->
    _.extend super,
      'mousemove': 'mousemove'

  initialize: () ->
    @.getTemplateFunction('product_modal', (templateFunction) =>
      @templateFunction = templateFunction
      @.render()
    )

  render: ->
    templateData = _.extend {vestPrice: TR.VEST_PRICE}, @model.toJSON()
    @.$el.html @templateFunction templateData
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
