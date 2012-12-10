window.TR = 
  toggleModal: (isOn) ->
    if isOn
      $('#shade').show().animate opacity: 0.8, 2000
    else
      $('#shade').animate opacity: 0, 2000, -> $(@).hide()



$ ->
  $('#shade').on 'click', -> TR.toggleModal(off)
