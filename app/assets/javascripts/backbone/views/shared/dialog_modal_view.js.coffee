class TR.Views.DialogModal extends TR.Views.Modal
  className: 'reveal-modal small dialog'

  events: ->
    _.extend super,
      'click a.yes': 'confirm'
      'click a.no': 'cancel'

  initialize: (options) ->
    @action = options.action || false
    @text = options.text || ''
    @template = @getTemplate 'dialog_modal'
    @render()

  render: ->
    @$el.html @template text: @text
    super()
    @$el.css 'top': '50%', 'margin-top': -@$el.height() / 2

  confirm: (e) ->
    e.preventDefault()
    @action() if @action
    @close()

  cancel: (e) ->
    e.preventDefault()
    @close()
