TR.Pages.Shop =
  initialize: ->
    $('.magnify').magnifier();

    $('#modal').reveal
      closeOnBackgroundClick: false
      animation: 'none'
      
    $('.customization-wrapper').on 'click', (e) =>
      e.preventDefault()
      @.setChecked $(e.currentTarget)

  setChecked: ($a) ->
    @.clearCheckboxes()
    $a.addClass('checked')
      .find('h5').append('<span>&#x2713;</span>');

  clearCheckboxes: ->
    $('#modal').find('a.customization-wrapper:visible').removeClass('checked').end()
      .find('h5:visible span').remove();


#      animation: 'fadeAndPop'
#    $('a').on 'click', (e) ->
#      e.preventDefault()
