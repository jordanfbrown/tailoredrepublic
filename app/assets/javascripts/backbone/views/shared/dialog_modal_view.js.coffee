class TR.Views.DialogModal extends TR.Views.Modal
  className: 'reveal-modal small dialog'

  events: ->
    _.extend super,
      'click a.confirm': 'confirm'
      'click a.cancel': 'cancel'

  initialize: (options) ->
    if $(window).width() < 480
      @$el.removeClass('small').addClass('expand')
    super()
    @action = options.action || false
    @text = options.text || ''
    @confirmText = options.confirmText || 'Ok'
    @cancelText = options.cancelText || 'Cancel'
    @confirmOnly = options.confirmOnly || false
    @template = @getTemplate 'dialog_modal'
    @render()

  render: ->
    @$el.html @template text: @text, confirmText: @confirmText, cancelText: @cancelText, confirmOnly: @confirmOnly
    super()
    @centerVertically()

  confirm: (e) ->
    e.preventDefault()
    @action() if @action
    @close()

  cancel: (e) ->
    e.preventDefault()
    @close()