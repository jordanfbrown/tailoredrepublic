Handlebars.registerHelper 'uppercaseFirst', (str) ->
  str.substr(0,1).toUpperCase() + str.substr 1, str.length

Handlebars.registerHelper 'ifLengthThree', (array, options) ->
  if array.length == 3
    options.fn(@)

Handlebars.registerHelper 'numberToString', (number) ->
  switch number
    when 0 then 'None'
    when 1 then 'One'
    when 2 then 'Two'
    when 3 then 'Three'

Handlebars.registerHelper 'decimalToInteger', (decimal) ->
  parseInt decimal

Handlebars.registerHelper 'ifeq', (a, b, options) ->
  if a == b
    options.fn(@)
    
Handlebars.registerHelper 'customizationHelper', (customization, lapel) ->
  if lapel == true
    '<img class="selected completed" src="assets/icons/chevron-selected.png">'
  else if customization
    '<img class="completed" src="assets/icons/chevron-completed.png">'
  else
    '<img src="assets/icons/chevron.png">'


