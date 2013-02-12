class TR.Views.NewUserModal extends TR.Views.Modal
  id: 'new-user-modal'

  className: 'reveal-modal medium'

  events: ->
    _.extend super,
      'submit form': 'submitForm'
      'click a.cancel': 'cancel'
      
  initialize: (options) ->
    @measurements = options.measurements
    $(window).on 'resize.newuser', @resize
    @template = @getTemplate 'new_user_modal'
    @render()

  render: ->
    @$el.html @template()
    super()
    @resize()

  resize: =>
    @updateWidth()
    @checkModalHeight()

  destroy: ->
    $(window).off 'resize.newuser'
    super()

  submitForm: (e) =>
    e.preventDefault()
    @$('.error').hide()
    @$('ul.error').empty()
    $f = $(e.currentTarget)
    params = $f.serialize() + '&' + $.param(measurement_id: @measurements.get('id'))
    $.post($f.attr('action'), params).then(@newUserSuccess, @handleErrors)
    false

  newUserSuccess: =>
    new TR.Views.DialogModal
      text: 'Your measurements have been successfully saved to your new account.'
      confirmText: 'Ok'
      confirmOnly: true
      action: =>
        window.location.href = '/shop/suits'
    @close()

  cancel: (e) ->
    e.preventDefault()
    window.location.href = '/shop/suits'
    @close()