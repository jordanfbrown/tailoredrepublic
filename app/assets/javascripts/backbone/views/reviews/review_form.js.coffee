class TR.Views.ReviewForm extends TR.Views.Base
  el: '.reviews'

  events:
    'click .stars li': 'clickedStar'
    'mouseover .stars li': 'updateStars'
    'mouseleave .stars': 'resetStars'

  clickedStar: (e) ->
    @updateStars(e)
    index = $(e.currentTarget).index()
    @$('#review_rating').val index + 1

  updateStars: (e) ->
    $target = $(e.currentTarget)
    index = $target.index()
    @$('.stars li').each (i, el) ->
      if index < i
        $(el).removeClass('selected').addClass('unselected')
      else
        $(el).removeClass('unselected').addClass('selected')

  resetStars: ->
    currentRating = @$('#review_rating').val()
    @$('.stars li').eq(currentRating - 1).trigger 'click'

