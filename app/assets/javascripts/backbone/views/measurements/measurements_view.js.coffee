class TR.Views.Measurements extends TR.Views.Base
  el: '#measurements'

  events: ->
    'submit form': 'submitMeasurement'
    'mousedown .measuring-tape': 'beginTapeDrag'
    'mouseup .measuring-tape': 'endTapeDrag'
    'mousemove .measuring-tape': 'tapeDrag'
    'touchstart .measuring-tape': 'beginTapeDrag'
    'touchend .measuring-tape': 'endTapeDrag'
    'touchmove .measuring-tape': 'tapeDrag'
    'mouseout .measuring-tape': 'mouseOutMeasuringTape'
    'click a.previous': 'previous'
    'click a.next': 'next'
    'click a.begin': 'next'
    'click a.accept-quick': 'acceptQuickFill'
    'click .progress-bar li': 'validateAndGoToSlide'
    'click a.accept': 'acceptMeasurements'
    'click .measurement-summary-list a': 'goToSlide'

  initialize: (options) ->
    @lineItemCount = options.lineItemCount
    @shirtOnly = options.shirtOnly
    @signedIn = options.signedIn

    @PROGRESS =
      COMPLETED: TR.ASSET_HOST + '/assets/icons/star-stroke.png'
      TODO: TR.ASSET_HOST + '/assets/icons/star-no-stroke.png'
      CURRENT: TR.ASSET_HOST + '/assets/icons/star-filled.png'

    measuringTapePixels = 4521
    measuringTapeInches = 90
    @pixelsPerInch = measuringTapePixels / measuringTapeInches

    @slider = @$('.measurements-list').bxSlider
      pager: off
      controls: off
      infiniteLoop: off
      onSlideBefore: @onSlideBefore
      adaptiveHeight: on
      touchEnabled: off
      video: on

    @slideCount = @slider.getSlideCount() - 1

    @currentTapeValue = @model.get 'neck' || @model.defaults.neck
    $(window).resize @resize
    @resize()
    @updateInputWithInches @currentTapeValue

    @template = @getTemplate 'measurement_summary'
    @model.on 'change', @updateSummaryPage
    @updateSummaryPage()

    unless @model.isNew()
      @$('iframe').attr 'src', ''
      @slider.goToSlide @slideCount
      _.delay @loadVideos, 500

  loadVideos: ->
    @$('iframe').each (index, el) ->
      $(el).attr 'src', $(el).data 'src'

  updateSummaryPage: =>
    templateData = _.extend {shirtOnly: @shirtOnly}, @model.toJSON()
    @$('.measurement-summary').html @template templateData

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
    e.preventDefault()
    @dragging = true
    touch = e.originalEvent.touches && (e.originalEvent.touches[0] || e.originalEvent.changedTouches[0])
    @initialDragPosition = e.offsetX || touch.pageX
    @initialBackgroundPosition = parseFloat @getMeasuringTape().css 'background-position-x'
 
  endTapeDrag: (e) ->
    e.preventDefault() if e
    @dragging = false
    finalBackgroundPosition = parseFloat @getMeasuringTape().css 'background-position-x'
    inches = @convertBackgroundPositionToInches finalBackgroundPosition
    @updateMeasuringTape inches, false

  tapeDrag: (e) ->
    e.preventDefault()
    if @dragging
      touch = e.originalEvent.touches && (e.originalEvent.touches[0] || e.originalEvent.changedTouches[0])
      offset = (e.pageX || touch.pageX) - @getMeasuringTape().offset().left
      positionX = @initialBackgroundPosition - (@initialDragPosition - offset)
      @getMeasuringTape().css 'background-position-x', positionX
      @updateInputWithPosition positionX
      
  mouseOutMeasuringTape: (e) ->
    unless e.toElement.className == 'pointer' || e.toElement.className == 'measuring-tape'
      @endTapeDrag()

  updateMeasuringTape: (inches, animate) ->
    @currentTapeValue = inches
    offset = @convertInchesToBackgroundPosition inches
    @getMeasuringTape()[if animate then 'animate' else 'css'] 'background-position-x': offset, 1000

  getMeasuringTape: ->
    @$('.measuring-tape').eq(@slider.getCurrentSlide() - 1)
    
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
    @$('.measurement-list-item').eq(@slider.getCurrentSlide() - 1).data 'measurement'

  onSlideBefore: ($el, oldIndex, newIndex) =>
    adjustedIndex = if oldIndex - 1 < 0 then 1000 else oldIndex - 1
    oldMeasurement = @$('.measurement-list-item').eq(adjustedIndex).data 'measurement'
    inches = parseFloat @$('input.measurement-input').eq(adjustedIndex).val()
    unless _.isNaN inches
      @model.setByName oldMeasurement, parseFloat inches

    @$('.previous').show() if newIndex > 0
    @$('.previous').hide() if newIndex == 0
    @$('.next, .accept').text('Accept').removeClass('next').addClass('accept') if newIndex == @slideCount
    @$('.next, .accept').text('Next').removeClass('accept').addClass('next') if newIndex < @slideCount

    @setProgressBar oldIndex, @PROGRESS.COMPLETED
    @setProgressBar newIndex, @PROGRESS.CURRENT

    @currentTapeValue = @model.get @getCurrentMeasurement() || @model.defaults[@getCurrentMeasurement()]
    @updateInputWithInches @currentTapeValue
    @resize()

  acceptMeasurements: (e) ->
    e.preventDefault()
    if @model.hasDefaultAttributes()
      @confirmDialog = new TR.Views.DialogModal
        text: 'It looks like your measurements are the same as our defaults. Are you sure that your measurements were entered correctly?',
        confirmText: 'Yes'
        cancelText: 'No'
        action: @saveMeasurements
    else
      @saveMeasurements()

  saveMeasurements: =>
    @model.save({}, {silent: true}).then(@saveSuccess, @saveError)

  saveSuccess: =>
    if @lineItemCount > 0
      window.location.href = '/orders/new'
    else if @lineItemCount == 0 && @signedIn
      window.location.href = '/shop/suits'
    else if @lineItemCount == 0 && !@signedIn
      @newUserModal = new TR.Views.NewUserModal(measurements: @model)

  saveError: =>
    TR.renderSimpleModal "We're sorry, but there was a problem saving your measurements. Please try again, and if the " +
     "problem persists, shoot us an e-mail at help@tailoredrepublic.com."

  setProgressBar: (index, progress) ->
    @$('.progress-bar img').eq(index).attr 'src', progress

  validateAndGoToSlide: (e) ->
    @slider.goToSlide $(e.currentTarget).index() if @validateCurrentInput()

  goToSlide: (e) ->
    e.preventDefault()
    @slider.goToSlide $(e.currentTarget).data 'index'

  getCurrentInput: ->
    @$('input.measurement-input').eq(@slider.getCurrentSlide() - 1)

  acceptQuickFill: (e) ->
    e.preventDefault()
    valid = true

    @$('.quick-measurement-form input[type=text]').each (index, el) =>
      $el = $(el)
      # ID is in the form measurement_attr_name -- this split returns attr_name
      name = $el.attr('id').split('measurement_')[1]
      inches = parseFloat $el.val()
      if _.isNaN(inches) || inches < 0 || inches > 90
        valid = false
        $el.addClass 'error'
      else
        $el.removeClass 'error'
        @model.setByName name, inches
      true

    if valid
      @$('.quick-fill-error').fadeOut()
      @slider.triggerResize(true)
      @saveMeasurements()
    else
      @$('.quick-fill-error').fadeIn()
      @slider.triggerResize(true)

  validateCurrentInput: ->
    $currentInput = @getCurrentInput()

    unless $currentInput.exists()
      return true

    inches = parseFloat $currentInput.val()
    if _.isNaN(inches) || inches < 0 || inches > 90
      $currentInput.next('.error').fadeIn()
      @slider.triggerResize(true)
      false
    else
      $currentInput.next('.error').fadeOut()
      @slider.triggerResize(true)
      true
