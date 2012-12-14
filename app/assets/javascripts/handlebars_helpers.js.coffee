Handlebars.registerHelper 'uppercaseFirst', (str) ->
  str.substr(0,1).toUpperCase() + str.substr 1, str.length

Handlebars.registerHelper 'ifLengthThree', (array, options) ->
  if array.length == 3
    options.fn(@)
