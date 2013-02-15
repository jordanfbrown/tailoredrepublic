#= require ./modal_view

class TR.Views.ProductModal extends TR.Views.Modal
  id: 'product-modal'

  className: 'reveal-modal xlarge'

  events: ->
    _.extend super,
      'mousemove img.magnify-small': 'magnify'
      'mouseleave img.magnify-small': 'stopMagnify'
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
    super()
    _.delay @setMagnifierMaxHeight, 500

  hideScrollbar: false

  resize: =>
    if $(window).width() < 1024
      @$el.removeClass('xlarge').addClass('expand')
    else
      @$el.removeClass('expand').addClass('xlarge')

    @setMagnifierMaxHeight()

  setMagnifierMaxHeight: =>
    height = @$el.height() - 100 + 'px'
    @$('.product-magnified').css('max-height': height, 'height': height)

  magnify: (e) ->
    @$('.product-summary').hide()

    $productMagnified = @$('.product-magnified')
    $productMagnified.show()

    $largeImg = $productMagnified.find('img')
    minLeft = -($largeImg.width() - $productMagnified.width())
    minTop = -($largeImg.height() - $productMagnified.height())
    $target = $(e.currentTarget)
    leftPercentage = e.offsetX / $target.width()
    topPercentage = e.offsetY / $target.height()
    @$('.product-magnified img').css(left: (minLeft * leftPercentage) + 'px', top: (minTop * topPercentage) + 'px')

  stopMagnify: (e) ->
    @$('.product-magnified').hide()
    @$('.product-summary').show()

  openCustomizationModal: (e) ->
    e.preventDefault()
    @destroy()
    @customizationView = new TR.Views.CustomizationModal(product: @model)

  addToCart: (e) =>
    e.preventDefault()
    @product = @model
    $.post('/line_items', { product_id: @model.get('id') }).then(
      _.bind(TR.Views.CustomizationModal.prototype.addSuccess, @),
      _.bind(TR.Views.CustomizationModal.prototype.addLineItemFailure, @)
    )

  destroy: ->
    $(window).off 'resize.product'
    super()


