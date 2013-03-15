class TR.Views.TapeMeasureRequests extends TR.Views.Base
  el: '.tape_measure_requests'

  events:
    'change #filter': 'filterTapeMeasureRequests'
    'change .sent-select': 'updateSent'

  filterTapeMeasureRequests: (e) ->
    value = $(e.currentTarget).val()
    window.location.href = "/admin/tape-measure-requests?filter=#{value}"

  updateSent: (e) ->
    $target = $(e.currentTarget)
    id = $target.data 'id'
    value = $target.val()
    $.ajax
      type: 'PUT'
      url: "/admin/tape-measure-requests/#{id}"
      data: { tape_measure_request: { sent: value == 'Yes' } }

