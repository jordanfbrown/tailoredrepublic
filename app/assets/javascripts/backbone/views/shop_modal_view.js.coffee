class TR.Views.ShopModal extends TR.Views.Base
  id: 'modal'
  className: 'reveal-modal expand'

  initialize: ->
    @customizationView = new TR.Views.Customization()
    @templateFunction = Handlebars.compile $('#modal-template').html()

  render: ->
    @.$el.html @templateFunction()
    @

  reveal: ->
    @.$el.reveal
      closeOnBackgroundClick: false
      animation: 'none'



