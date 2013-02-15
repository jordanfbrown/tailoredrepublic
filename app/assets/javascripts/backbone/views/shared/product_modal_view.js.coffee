#= require ./modal_view

class TR.Views.ProductModal extends TR.Views.Modal
  id: 'product-modal'

  className: 'reveal-modal xlarge'

  events: ->
    _.extend super,
      'mousemove': 'mousemove'
      'click a.customize': 'openCustomizationModal'
      'click a.add-to-cart': 'addToCart'

  initialize: (options) ->
    super()
    @customization = options.customization
    @template = @getTemplate 'product_modal'
    $(window).on 'resize.product', @resize
    @resize()
    @render()

  render: ->
    @$el.html @template _.extend
      customizable: @model.isCustomizable()
    , @model.toJSON()
    @enableMagnifier();
    super()

  hideScrollbar: false

  resize: =>
    if $(window).width() < 1024
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

  addToCart: (e) =>
    e.preventDefault()
    @product = @model
    $.post('/line_items', { product_id: @model.get('id') }).then(
      _.bind(TR.Views.CustomizationModal.prototype.addSuccess, @),
      _.bind(TR.Views.CustomizationModal.prototype.addLineItemFailure, @)
    )

  enableMagnifier: ->
    @$('.magnify').magnifier()

  magnifierVisible: ->
    @$('.magnify-large').is ':visible'

  hideMagnifier: ->
    @$('.magnify-large').hide()

  destroy: ->
    $(window).off 'resize.product'
    super()


