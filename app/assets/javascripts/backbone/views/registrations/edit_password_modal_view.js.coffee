class TR.Views.EditPasswordModal extends TR.Views.Modal
  id: 'edit-password-modal'

  className: 'reveal-modal medium'

  events: ->
    _.extend super,
      'submit form': 'submitForm'
      'click a.cancel': 'cancel'

  initialize: (options) ->
    $(window).on 'resize.editpassword', @resize
    @template = @getTemplate 'edit_password_modal'
    @render()

  render: ->
    @$el.html @template()
    super()
    @resize()

  resize: =>
    @updateWidth()
    @checkModalHeight()

  destroy: ->
    $(window).off 'resize.editpassword'
    super()

  submitForm: (e) =>
    e.preventDefault()
    @$('.error').hide()
    @$('ul.error').empty()
    $f = $(e.currentTarget)
    $.ajax(
      type: 'put'
      url: $f.attr('action')
      data: $f.serialize()
    ).then(@editPasswordSuccess, @handleErrors)
    false

  editPasswordSuccess: =>
    TR.renderSimpleModal 'Your password has been successfully updated.'

  cancel: (e) ->
    e.preventDefault()
    @close()