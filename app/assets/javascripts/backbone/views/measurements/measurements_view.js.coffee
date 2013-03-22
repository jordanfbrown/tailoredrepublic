class TR.Views.Measurements extends TR.Views.Base
  el: '#measurements'

  numberRegex: /^[0-9]+$/

  slideOffset: 2 # Currently 2 slides exist before the measurement slides start

  measuringTapePixels: 4521

  measuringTapeInches: 90

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
    'click .progress-bar li': 'validateAndGoToSlide'
    'click a.accept-quick': 'acceptMeasurements'
    'click a.accept': 'acceptMeasurements'
    'click a.skip-to-end': 'goToLastSlide'
    'click a.youtube-video': 'loadVideo'

  initialize: (options) ->
    @lineItemCount = options.lineItemCount
    @onlyShirts = options.onlyShirts
    @signedIn = options.signedIn
    @initialSlide = options.initialSlide
    @signUpMethod = options.signUpMethod
    @currentTapeValue = @model.get 'neck' || @model.defaults.neck
    @pixelsPerInch = @measuringTapePixels / @measuringTapeInches
    @template = @getTemplate 'measurement_summary'

    @trackView()
    @loadVideoImages()
    @createSlider()
    @resize()
    @updateInputWithInches @currentTapeValue
    @updateSummaryPage()
    @bindEvents()
    @configureInitialSlide()

  loadVideoImages: ->
    @$('.youtube-video').each (index, el) =>
      videoId = $(el).data 'video'
      image = "http://img.youtube.com/vi/#{videoId}/0.jpg"
      $(el).css background: "#fff url('#{image}') center no-repeat"

  loadVideo: (e) ->
    e.preventDefault()
    $target = $(e.currentTarget)
    video = $target.data 'video'
    $iframe = $('<iframe></iframe>').attr(
      width: $target.width()
      height: $target.height()
      src: "//www.youtube.com/embed/#{video}?frameborder=0&autohide=1&controls=0&rel=0&modestbranding=1&showinfo=0&autoplay=1"
    ).on 'load', =>
      @$('.measurement-list-item').fitVids()
    $target.replaceWith $iframe

  createSlider: ->
    @slider = @$('.measurements-list').bxSlider
      pager: off
      controls: off
      infiniteLoop: off
      onSlideBefore: @onSlideBefore
      adaptiveHeight: on
      touchEnabled: off
      video: on
      heightFix: on
      useCSS: off

    @slideCount = @slider.getSlideCount() - 1

  trackView: ->
    mixpanel.track 'Viewed Measurements', { 'New User': @model.isNew() }

  bindEvents: ->
    History.Adapter.bind window, 'statechange', =>
      state = History.getState()
      @slider.goToSlide(state.data.index) if state.data && (state.data.index || state.data.index == 0)

    $(window).on 'resize', @resize
    $(document).on 'keydown', @preventTab
    @model.on 'change', @updateSummaryPage

  preventTab: (e) =>
    currentSlide = @slider.getCurrentSlide()
    if e.which == 9 && (1 < currentSlide < @slideCount)
      e.preventDefault()

  goToInitialSlide: ->
    index = @$(".measurements-list li[data-measurement=#{@initialSlide}]").index()
    @slider.goToSlide index

  updateSummaryPage: =>
    templateData = _.extend {onlyShirts: @onlyShirts}, @model.toJSON()
    @$('.measurement-summary').html @template templateData

  submitMeasurement: (e) ->
    e.preventDefault()
    $input = $(e.currentTarget).find('input')
    inches = parseFloat $input.val()

    if @validateCurrentInput()
      inches = @roundToNearestQuarter inches
      @updateMeasuringTape inches, true
      $input.val inches
      _.delay =>
        @slider.goToNextSlide()
      , 1200

  resize: =>
    @updateMeasuringTape @currentTapeValue, false

  configureInitialSlide: ->
    if @initialSlide
      @goToInitialSlide()
    else
      if @model.isNew()
        History.replaceState {index: 0}, 'Measurements - Overview | Tailored Republic', '/measurements/overview'
      else
        @slider.goToSlide @slideCount
    
  beginTapeDrag: (e) ->
    e.preventDefault()
    @dragging = true
    touch = e.originalEvent && e.originalEvent.touches && (e.originalEvent.touches[0] || e.originalEvent.changedTouches[0])
    e.offsetX = e.pageX - $(e.currentTarget).offset().left if e.offsetX == undefined && !touch
    @initialDragPosition = e.offsetX || touch.pageX - $(e.currentTarget).offset().left
    @initialBackgroundPosition = parseFloat @getMeasuringTape().css 'background-position'

  endTapeDrag: (e) ->
    e.preventDefault() if e
    @dragging = false
    finalBackgroundPosition = parseFloat @getMeasuringTape().css 'background-position'
    inches = @convertBackgroundPositionToInches finalBackgroundPosition
    @updateMeasuringTape inches, false

  tapeDrag: (e) ->
    e.preventDefault()
    if @dragging
      touch = e.originalEvent.touches && (e.originalEvent.touches[0] || e.originalEvent.changedTouches[0])
      offset = (e.pageX || touch.pageX) - @getMeasuringTape().offset().left
      positionX = @initialBackgroundPosition - (@initialDragPosition - offset)
      @getMeasuringTape().css 'background-position', "#{positionX}px 0px"
      @updateInputWithPosition positionX
      
  mouseOutMeasuringTape: (e) ->
    if element = e.toElement || e.relatedTarget
      unless element.className == 'pointer' || element.className == 'measuring-tape'
        @endTapeDrag()

  updateMeasuringTape: (inches, animate) ->
    @currentTapeValue = inches
    offset = @convertInchesToBackgroundPosition inches
    if animate
      @getMeasuringTape().animate 'background-position': "#{offset}px", 1000
    else
      @getMeasuringTape().css 'background-position', "#{offset}px"

  getMeasuringTape: ->
    @$('.measuring-tape').eq(@slider.getCurrentSlide() - @slideOffset)
    
  updateInputWithPosition: (positionX) ->
    inches = @convertBackgroundPositionToInches positionX
    if inches < 0
      inches = (90 + inches) % 90
    else if inches > 90
      inches = (inches - 90) % 90

    @updateInputWithInches inches

  updateInputWithInches: (inches) ->
    @getCurrentMeasurementInput().val inches

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
    @$('.measurement-list-item').eq(@slider.getCurrentSlide() - @slideOffset).data 'measurement'

  onSlideBefore: ($el, oldIndex, newIndex) =>
    currentSlideName = $el.data 'measurement'
    lastState = History.getLastSavedState()
    unless lastState.data.index == newIndex
      History.pushState {index: newIndex}, "Measurements - #{TR.titleize(currentSlideName)} | Tailored Republic",
      "/measurements/#{currentSlideName}"
    @$('.next, .accept').text('Accept').removeClass('next').addClass('accept') if newIndex == @slideCount
    @$('.next, .accept').text('Next').removeClass('accept').addClass('next') if newIndex < @slideCount

    if newIndex > 0
      @$('.previous').show()
      @$('.next, .accept').show()
    else
      @$('.previous').hide()
      @$('.next, .accept').hide()

    @setProgressBar newIndex

    # Only set measurement values for measurement slides
    if oldIndex >= @slideOffset
      # jQuery eq function wraps around if you enter a negative value: eq(-1) will return eq(15) for an array of length
      # 16. To prevent this, I'm just setting the index to a very large value so that the wrapping doesn't occur
      adjustedIndex = if oldIndex - @slideOffset < 0 then 1000 else oldIndex - @slideOffset
      oldMeasurement = @$('.measurement-list-item').eq(adjustedIndex).data 'measurement'
      inches = parseFloat @$('input.measurement-input').eq(adjustedIndex).val()
      unless _.isNaN inches
        @model.setByName oldMeasurement, parseFloat inches

    @currentTapeValue = @model.get @getCurrentMeasurement() || @model.defaults[@getCurrentMeasurement()]
    @updateInputWithInches @currentTapeValue
    @resize()

  saveMeasurements: =>
    @model.save({}, {silent: true}).then(@saveSuccess, @saveError)

  saveSuccess: =>
    TR.Analytics.trackEvent 'Measurements', 'Accept'
    mixpanel.track 'Accepted Measurements'

    if @lineItemCount > 0
      window.location.href = '/orders/new'
    else if @lineItemCount == 0 && @signedIn
      window.location.href = '/shop/suits'
    else if @lineItemCount == 0 && !@signedIn
      @newUserModal = new TR.Views.NewUserModal(measurements: @model, signUpMethod: @signUpMethod)

  saveError: (e) =>
    try
      error = JSON.parse e.responseText
      if _.has(error, 'age') || _.has(error, 'weight') || _.has(error, 'height')
        new TR.Views.DialogModal
          text: "We're sorry, but there was a problem saving your measurements. It looks you entered an invalid value " +
                "for age, weight, or height. Please click OK to return to the age, height, and weight slide."
          confirmText: 'Ok'
          confirmOnly: true
          action: =>
            @slider.goToSlide 1
      else
        TR.renderSimpleModal "We're sorry, but there was a problem saving your measurements. Please try again, and if the " +
        "problem persists, shoot us an email at help@tailoredrepublic.com."
    catch parseError
      TR.renderSimpleModal "We're sorry, but there was a problem saving your measurements. Please try again, and if the " +
       "problem persists, shoot us an email at help@tailoredrepublic.com."

  setProgressBar: (index) ->
    @$('.progress-bar li').removeClass 'selected'
    @$('.progress-bar li').eq(index).addClass 'selected'

  validateAndGoToSlide: (e) ->
    @slider.goToSlide $(e.currentTarget).index() if @validateCurrentInput()

  goToLastSlide: (e) ->
    e.preventDefault()
    @slider.goToSlide @slideCount

  getCurrentMeasurementInput: ->
    index = @slider.getCurrentSlide() - @slideOffset
    index = 1000 if index < 0
    @$('input.measurement-input').eq(index)

  acceptMeasurements: (e) ->
    e.preventDefault()

    $form = @$('.quick-measurement-form')
    ageWeightHeightValid = @validateAgeHeightWeight($form, true)
    measurementsValid = @validateMeasurements($form)

    if ageWeightHeightValid && measurementsValid
      $form.find('.error-list').empty()
      @slider.triggerResize(true)
      if @model.hasDefaultAttributes()
        @confirmDialog = new TR.Views.DialogModal
          text: 'It looks like your measurements are the same as our defaults. Are you sure that your measurements were entered correctly?',
          confirmText: 'Yes'
          cancelText: 'No'
          action: @saveMeasurements
      else
        @saveMeasurements()
    else
      @slider.triggerResize(true)

  validateCurrentInput: ->
    # Height, age, and weight
    if @slider.getCurrentSlide() == @slideOffset - 1
      $form = @$('.height-age-weight')
      @validateAgeHeightWeight($form)
    else
      $currentInput = @getCurrentMeasurementInput()

      unless $currentInput.exists()
        return true

      inches = parseFloat $currentInput.val()
      if @inchesInvalid(inches)
        $currentInput.next('.error').fadeIn()
        @slider.triggerResize true
        false
      else
        $currentInput.next('.error').fadeOut()
        @slider.triggerResize true
        inches = @roundToNearestQuarter(inches)
        $currentInput.val inches
        true

  validateMeasurements: ($form) ->
    valid = true

    $form.find('.quick-measurement-input').each (index, el) =>
      $el = $(el)
      # ID is in the form measurement_attr_name -- this split returns attr_name
      name = $el.attr('id').split('measurement_')[1]
      inches = parseFloat $el.val()
      if @inchesInvalid(inches)
        valid = false
        $el.addClass 'error'
        unless $form.find('.quick-measurement-error').exists()
          $form.find('.error-list').append('<li class="quick-measurement-error">Measurements must be a number in inches between 0 and 90.</li>')
      else
        $el.removeClass 'error'
        inches = @roundToNearestQuarter inches
        @model.setByName name, inches, { silent: true }
      true

    valid

  inchesInvalid: (inches) ->
    _.isNaN(inches) || inches <= 0 || inches >= 90

  validateAgeHeightWeight: ($form, silent = false) ->
    $height = $form.find('#measurement_height')
    $weight = $form.find('#measurement_weight')
    $age = $form.find('#measurement_age')
    height = parseInt $height.val()
    weight = parseInt $weight.val()
    age = parseInt $age.val()

    $errors = $form.find('.error-list')
    $errors.empty()
    valid = true

    if age <= 0 || age >= 110 || _.isNaN(age) || !@numberRegex.test($age.val())
      $errors.append '<li>Age must be a number between 0 and 110</li>'
      $age.addClass 'error'
      valid = false
    else
      $age.removeClass 'error'

    if height <= 0 || height >= 96 || _.isNaN(height) || !@numberRegex.test($height.val())
      $errors.append '<li>Height must be a number in inches between 0 and 96</li>'
      $height.addClass 'error'
      valid = false
    else
      $height.removeClass 'error'

    if weight <= 0 || weight >= 400 || _.isNaN(weight) || !@numberRegex.test($weight.val())
      $errors.append '<li>Weight must be a number in pounds between 0 and 400</li>'
      $weight.addClass 'error'
      valid = false
    else
      $weight.removeClass 'error'

    if valid
      $height.val height
      $age.val age
      $weight.val weight
      @model.set
        height: height
        weight: weight
        age: age
      , { silent: silent }
    else
      $errors.fadeIn()

    @slider.triggerResize true
    valid
