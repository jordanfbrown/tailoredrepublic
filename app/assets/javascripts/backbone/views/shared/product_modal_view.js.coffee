#= require ./modal_view

class TR.Views.ProductModal extends TR.Views.Modal
  id: 'product-modal'

  events: ->
    _.extend super,
      'mousemove': 'mousemove'

  initialize: () ->
    TR.Events.on 'addedToCart', @addedToCart
    @template = @getTemplate 'product_modal'
    @render()

  render: ->
    templateData = _.extend {vestPrice: TR.VEST_PRICE}, @model.toJSON()
    @$el.html @template templateData
    @customizationView = new TR.Views.Customization el: @$('.customizations'), product: @model
    @enableMagnifier();
    super()

  # This ensures that the magnifier is hidden when the mouse is no longer over the image
  mousemove: (e) ->
    $small = $('.small')
    offsetLeft = $small.offset().left
    offsetTop = $small.offset().top

    if (e.pageX < offsetLeft || e.pageX > offsetLeft + $small.width() ||
       e.pageY < offsetTop || e.pageY > offsetTop + $small.height()) && @magnifierVisible()
      @hideMagnifier()
      
  addedToCart: (data) =>
    new TR.Views.AddSuccessModal({model: data.product})
    @destroy()

  destroy: ->
    super()
    @customizationView.destroy()

  enableMagnifier: ->
    @$('.magnify').magnifier()

  magnifierVisible: ->
    @$('.large').is ':visible'

  hideMagnifier: ->
    @$('.large').hide()