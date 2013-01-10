class TR.Views.Measurements extends TR.Views.Base
  el: '#measurements'

  events: ->
    'submit form': 'submitMeasurement'
    'mousedown .measuring-tape': 'beginTapeDrag'
    'mouseup .measuring-tape': 'endTapeDrag'
    'mousemove .measuring-tape': 'tapeDrag'
    'click a.previous': 'previous'
    'click a.next': 'next'
    'click .progress-bar li': 'goToSlide'
    'click a.accept': 'acceptMeasurements'

  PROGRESS:
    COMPLETED: 'assets/icons/star-stroke.png'
    TODO: 'assets/icons/star-no-stroke.png'
    CURRENT: 'assets/icons/star-filled.png'

  initialize: (options) ->
    @entry = options.entry

    measuringTapePixels = 4521
    measuringTapeInches = 90
    @pixelsPerInch = measuringTapePixels / measuringTapeInches

    @slider = @$('.measurements-list').bxSlider
      pager: off
      controls: off
      infiniteLoop: off
      onSlideBefore: @onSlideBefore
      adaptiveHeight: on

    @currentTapeValue = @model.get 'neck' || @model.defaults.neck
    $(window).resize @resize
    @resize()
    @updateInputWithInches @currentTapeValue

    @template = @getTemplate 'measurement_summary'
    @model.on 'change', @updateSummaryPage
    @updateSummaryPage()

    @slider.goToSlide 15 unless @model.isNew()

  updateSummaryPage: =>
    @$('.measurement-summary').html @template @model.toJSON()

  submitMeasurement: (e) ->
    e.preventDefault()
    $input = $(e.currentTarget).find('input')
    inches = parseFloat $input.val()

    if @validateCurrentInput()
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
      positionX = @initialBackgroundPosition - (@initialDragPosition - offset)
      @getMeasuringTape().css 'background-position-x', positionX
      @updateInputWithPosition positionX

  updateMeasuringTape: (inches, animate) ->
    @currentTapeValue = inches
    offset = @convertInchesToBackgroundPosition inches
    @getMeasuringTape()[if animate then 'animate' else 'css'] 'background-position-x': offset, 1000

  getMeasuringTape: ->
    @$('.measuring-tape').eq(@slider.getCurrentSlide())
    
  updateInputWithPosition: (positionX) ->
    inches = @convertBackgroundPositionToInches positionX
    if inches < 0
      inches = (90 + inches) % 90
    else if inches > 90
      inches = (inches - 90) % 90

    @updateInputWithInches inches

  updateInputWithInches: (inches) ->
    @getCurrentInput().val inches

  roundToNearestQuarter: (number) ->
    parseFloat (Math.round(number * 4) / 4).toFixed(2)

  convertBackgroundPositionToInches: (position) ->
    @roundToNearestQuarter (position - @getMeasuringTape().width() / 2) / -@pixelsPerInch

  convertInchesToBackgroundPosition: (inches) ->
    -@pixelsPerInch * inches + @getMeasuringTape().width() / 2

  previous: (e) ->
    e.preventDefault()
    @slider.goToPrevSlide() if @validateCurrentInput()

  next: (e) ->
    e.preventDefault()
    @slider.goToNextSlide() if @validateCurrentInput()

  getCurrentMeasurement: ->
    @$('.measurement-list-item').eq(@slider.getCurrentSlide()).data 'measurement'

  onSlideBefore: ($el, oldIndex, newIndex) =>
    oldMeasurement = @$('.measurement-list-item').eq(oldIndex).data 'measurement'
    inches = parseFloat @$('input.measurement-input').eq(oldIndex).val()
    unless _.isNaN inches
      @model.setByName oldMeasurement, parseFloat inches

    @$('.previous').show() if newIndex > 0
    @$('.previous').hide() if newIndex == 0
    @$('.next, .accept').text('Accept').removeClass('next').addClass('accept') if newIndex == 15
    @$('.next, .accept').text('Next').removeClass('accept').addClass('next') if newIndex < 15

    @setProgressBar oldIndex, @PROGRESS.COMPLETED
    @setProgressBar newIndex, @PROGRESS.CURRENT

    @currentTapeValue = @model.get @getCurrentMeasurement() || @model.defaults[@getCurrentMeasurement()]
    @updateInputWithInches @currentTapeValue
    @resize()

  acceptMeasurements: (e) ->
    e.preventDefault()
    @model.save({}, {silent: true}).then(@saveSuccess, @saveError)

  saveSuccess: (a, b, c) =>
    if @entry == 'checkout'
      window.location.href = '/order/new'

  saveError: =>
    console.log('save error');

  setProgressBar: (index, progress) ->
    @$('.progress-bar img').eq(index).attr 'src', progress

  goToSlide: (e) ->
    @slider.goToSlide $(e.currentTarget).index() if @validateCurrentInput()

  getCurrentInput: ->
    @$('input.measurement-input').eq(@slider.getCurrentSlide())

  validateCurrentInput: ->
    $currentInput = @getCurrentInput()

    unless $currentInput.exists()
      return true

    inches = parseFloat $currentInput.val()
    if _.isNaN(inches) || inches < 0 || inches > 90
      $currentInput.next('.error').fadeIn()
      false
    else
      $currentInput.next('.error').fadeOut()
      true
