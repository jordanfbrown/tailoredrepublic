class TR.Views.ReviewOrder extends TR.Views.Base
  el: '#review-order'

  events:
    'click a.edit-information': 'editInformation'

  initialize: ->
    mixpanel.track 'Viewed Review Order Page'

  editInformation: (e) ->
    e.preventDefault()
    @$('form').attr('action', '/orders/new').submit()
