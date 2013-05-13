class TR.Views.Graduation extends TR.Views.Base
  el: '.graduation'

  events:
    'submit .graduation-form': 'submitForm'

  submitForm: (e) ->
    e.preventDefault()
    amount = @$('#card_amount').val()
    if amount.charAt(0) == '$'
      amount = amount.substr(1, amount.length)
    @amount = parseFloat amount
    if _.isNaN(@amount) || @amount <= 0
      @$('.errors').show()
    else
      @$('.errors').hide()
      @$('.graduation-button').addClass 'disabled'
      @addGiftCardToCart

  addGiftCardToCart: ->

    $.post('/line-items', {product_id: id}).then(@addSuccess, @addFailure)

  addSuccess: =>
    TR.Events.trigger 'addedLineItem'
    @successDialog = new TR.Views.DialogModal
      text: "A $#{@amount} gift card has been added to your cart!"
      confirmText: 'Checkout'
      cancelText: 'Close'
      action: ->
        window.location.href = '/cart'

  addFailure: ->
    @failureDialog = new TR.Views.DialogModal
      text: "We're sorry, but there was a problem adding the gift card to your cart. Please try again, and if the problem persists, shoot as an email at help@tailoredrepublic.com"
      confirmOnly: true
      confirmText: 'Ok'


