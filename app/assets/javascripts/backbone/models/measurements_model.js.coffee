class TR.Models.Measurement extends TR.Models.Base
  url: '/measurements'

  initialize: (attributes) ->
    _.each attributes, (value, name) =>
      @attributes[name] = parseFloat value

  defaults:
    neck: 15.5
    chest: 38.25
    front: 17.5
    stomach: 34.5
    waist: 34
    hips: 40.5
    full_shoulders: 19
    back: 16.25
    arm_length: 24.25
    bicep: 12
    wrist: 6.75
    jacket_length: 28.5
    crotch: 27.5
    thigh: 24
    pant_length: 40.25
