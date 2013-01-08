class TR.Views.Measurements extends TR.Views.Base
  el: '#measurements'

  events: ->
    'submit form': 'submitMeasurement'

  initialize: ->
    @currentTapeValue = 10
    $(window).resize @resize
    @resize()

  submitMeasurement: (e) ->
    e.preventDefault()
    value = parseFloat $(e.currentTarget).find('input').val()

    if _.isNaN value
      console.log('not a number');
    else
      @updateMeasuringTape value, true
      
  resize: =>
    @updateMeasuringTape @currentTapeValue, false

  updateMeasuringTape: (value, animate) ->
    @currentTapeValue = value
    $tape = @$('.measuring-tape:visible')
    tapeWidth = $tape.width()
    offset = -50.23333 * value + tapeWidth / 2

    $tape[if animate then 'animate' else 'css'] 'background-position-x': offset, 1000





