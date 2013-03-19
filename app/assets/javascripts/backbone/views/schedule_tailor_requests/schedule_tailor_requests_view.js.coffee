class TR.Views.ScheduleTailorRequests extends TR.Views.Base
  el: '.schedule_tailor_requests'

  events:
    'change #filter': 'filterScheduleTailorRequests'
    'change .status-select': 'updateSent'

  filterScheduleTailorRequests: (e) ->
    value = $(e.currentTarget).val()
    window.location.href = "/admin/tailor-requests?filter=#{value}"

  updateSent: (e) ->
    $target = $(e.currentTarget)
    id = $target.data 'id'
    value = $target.val()
    $.ajax
      type: 'PUT'
      url: "/admin/tailor-requests/#{id}"
      data: { schedule_tailor_request: { status: value } }
