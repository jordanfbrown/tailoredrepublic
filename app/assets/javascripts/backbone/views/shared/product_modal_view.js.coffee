#= require ./modal_view

class TR.Views.ProductModal extends TR.Views.Modal
  id: 'product-modal'

  className: 'reveal-modal xlarge'

  events: ->
    _.extend super,
      'mousemove': 'mousemove'
      'click a.customize': 'openCustomizationModal'

  initialize: (options) ->
    @customization = options.customization
    @template = @getTemplate 'product_modal'
    $(window).on 'resize.product', @resize
    @render()

  render: ->
    @$el.html @template @model.toJSON()
    @enableMagnifier();
    super()

  resize: =>
    if $(window).width() < 768
      @$el.removeClass('xlarge').addClass('expand')
    else
      @$el.removeClass('expand').addClass('xlarge')

  # This ensures that the magnifier is hidden when the mouse is no longer over the image
  mousemove: (e) ->
    $small = $('.magnify-small')
    offsetLeft = $small.offset().left
    offsetTop = $small.offset().top

    if (e.pageX < offsetLeft || e.pageX > offsetLeft + $small.width() ||
       e.pageY < offsetTop || e.pageY > offsetTop + $small.height()) && @magnifierVisible()
      @hideMagnifier()

  openCustomizationModal: (e) ->
    e.preventDefault()
    @destroy()
    @customizationView = new TR.Views.CustomizationModal product: @model

  enableMagnifier: ->
    @$('.magnify').magnifier()

  magnifierVisible: ->
    @$('.magnify-large').is ':visible'

  hideMagnifier: ->
    @$('.magnify-large').hide()

  destroy: ->
    $(window).off 'resize.product'
    super()


