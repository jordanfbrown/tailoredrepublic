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
    if $(window).width() < 768
      @$el.removeClass('medium').addClass('expand')
    else
      @$el.removeClass('expand').addClass('medium')

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
    console.log params
    $.post($f.attr('action'), params).then(@newUserSuccess, @newUserFailure)
    false

  newUserSuccess: =>
    new TR.Views.DialogModal
      text: 'Your measurements have been successfully saved to your new account.'
      confirmText: 'Ok'
      confirmOnly: true
      action: =>
        window.location.href = '/shop/suits'
    @close()

  newUserFailure: (response) =>
    errors = JSON.parse response.responseText
    @$('.error').show()
    $errorList = @$('ul.error')
    _.each errors, (message, field) ->
      $errorList.append("<li>#{field.capitalize()} #{message}</li>")

  cancel: (e) ->
    e.preventDefault()
    @close()