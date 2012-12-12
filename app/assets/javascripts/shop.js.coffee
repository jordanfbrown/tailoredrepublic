TR.Pages.Shop =
  initialize: ->
    $('.magnify').magnifier();

    $('a').on 'click', (e) ->
      e.preventDefault()
      $('#modal').reveal
        closeOnBackgroundClick: false
        animation: 'fadeAndPop'