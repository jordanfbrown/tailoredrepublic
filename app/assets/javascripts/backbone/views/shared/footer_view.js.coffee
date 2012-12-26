class TR.Views.Footer extends TR.Views.Base
  el: 'footer'

  events:
    'click h5.expandable': 'expandSection'

  initialize: ->
    $(window).resize(->
      if $(window).width() >= 768
        @$('ul').css('display', '')
        @$('h5 span').text '+'
    )

  expandSection: (e) ->
    if $(window).width() < 768
      $target = $(e.currentTarget)
      $ul = $target.next 'ul:not(.always-show)'
      if $ul.is ':visible'
        $target.next('ul').hide 'slideDown'
        $target.find('span').text '+'
      else
        $target.next('ul').show 'slideUp'
        $target.find('span').text '-'

