class TR.Models.Measurements extends TR.Models.Base
  url: ->
    super('/measurements')
    
  validate: (attrs) ->
    console.log(attrs);


