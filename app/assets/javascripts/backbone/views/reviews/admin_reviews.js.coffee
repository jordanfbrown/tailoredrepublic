class TR.Views.AdminReviews extends TR.Views.Base
  el: '.reviews'

  events:
    'change #filter': 'filterReviews'
    'change .status-select': 'updateStatus'

  filterReviews: (e) ->
    value = $(e.currentTarget).val()
    window.location.href = "/admin/reviews?filter=#{value}"

  updateStatus: (e) ->
    $target = $(e.currentTarget)
    id = $target.data 'id'
    value = $target.val()
    $.ajax
      type: 'PUT'
      url: "/reviews/#{id}"
      data: { review: { status: value } }
