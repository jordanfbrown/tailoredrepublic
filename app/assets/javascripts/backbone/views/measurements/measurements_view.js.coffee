class TR.Views.Measurements extends TR.Views.Base
  el: '#measurements'

  events: ->
    'submit form': 'submitMeasurement'
    'mousedown .measuring-tape': 'beginTapeDrag'
    'mouseup .measuring-tape': 'endTapeDrag'
    'mousemove .measuring-tape': 'tapeDrag'

  initialize: ->
    measuringTapePixels = 4521
    measuringTapeInches = 90
    @pixelsPerInch = measuringTapePixels / measuringTapeInches
    @currentTapeValue = 10
    $(window).resize @resize
    @resize()

  submitMeasurement: (e) ->
    e.preventDefault()
    $input = $(e.currentTarget).find('input')
    inches = parseFloat $input.val()

    if _.isNaN inches
      console.log('not a number');
    unless 90 > inches > 0
      console.log 'out of range'
    else
      inches = @roundToNearestQuarter inches
      @updateMeasuringTape inches, true
      $input.val inches
      
  resize: =>
    @updateMeasuringTape @currentTapeValue, false
    
  beginTapeDrag: (e) ->
    @dragging = true
    @initialDragPosition = e.offsetX
    @initialBackgroundPosition = parseFloat @getMeasuringTape().css 'background-position-x'
 
  endTapeDrag: ->
    @dragging = false
    finalBackgroundPosition = parseFloat @getMeasuringTape().css 'background-position-x'
    inches = @convertBackgroundPositionToInches finalBackgroundPosition
    @updateMeasuringTape inches, false

  tapeDrag: (e) ->
    if @dragging
      offset = e.pageX - @getMeasuringTape().offset().left
      $tape = @getMeasuringTape()
      positionX = @initialBackgroundPosition - (@initialDragPosition - offset)
      $tape.css 'background-position-x', positionX
      @updateInput positionX

  updateMeasuringTape: (inches, animate) ->
    @currentTapeValue = inches
    offset = @convertInchesToBackgroundPosition inches
    @getMeasuringTape()[if animate then 'animate' else 'css'] 'background-position-x': offset, 1000

  getMeasuringTape: ->
    @$('.measuring-tape:visible')
    
  updateInput: (positionX) ->
    inches = @convertBackgroundPositionToInches positionX
    if inches < 0
      inches = (90 + inches) % 90
    else if inches > 90
      inches = (inches - 90) % 90
    @$('input.measurement-input:visible').val inches

  roundToNearestQuarter: (number) ->
    parseFloat (Math.round(number * 4) / 4).toFixed(2)

  convertBackgroundPositionToInches: (position) ->
    @roundToNearestQuarter (position - @getMeasuringTape().width() / 2) / -@pixelsPerInch

  convertInchesToBackgroundPosition: (inches) ->
    -@pixelsPerInch * inches + @getMeasuringTape().width() / 2










