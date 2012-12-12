TR.Pages.Shop =
  initialize: ->
    $('.magnify').magnifier();

    $('a').on 'click', (e) ->
      e.preventDefault()
      $('#modal').reveal
        closeOnBackgroundClick: false
        animation: 'fadeAndPop'
        
    $(window).scroll @.scroll
    $('.reveal-modal').scroll ->
      console.log('reveal');
      
  scroll: (e) ->
    console.log('window');
    $modal = $('.reveal-modal')
    if $modal.is ':visible'
      $modal.css 'top', $(window).scrollTop() + 20 + 'px'