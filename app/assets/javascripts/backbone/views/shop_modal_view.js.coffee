class TR.Views.ShopModal extends TR.Views.Base
  id: 'modal'

  className: 'reveal-modal expand'

  initialize: ->
    @templateFunction = Handlebars.compile $('#modal-template').html()

  render: ->
    @.$el.html @templateFunction() # Data will eventually get passed into this function
    @customizationView = new TR.Views.Customization el: @.$ '.customizations'
    @.enableMagnifier();
    @

  destroy: ->
    super()
    @customizationView.destroy()

  enableMagnifier: ->
    @.$('.magnify').magnifier();

  reveal: ->
    @.$el.reveal
      closeOnBackgroundClick: false
      animation: 'none'
      closed: =>
        @.destroy()



