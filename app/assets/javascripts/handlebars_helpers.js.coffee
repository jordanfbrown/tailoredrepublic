Handlebars.registerHelper 'uppercaseFirst', (str) ->
  str.substr(0,1).toUpperCase() + str.substr 1, str.length

Handlebars.registerHelper 'ifLengthThree', (array, options) ->
  if array.length == 3
    options.fn @

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
    options.fn @

Handlebars.registerHelper 'ifVest', (customization, numButtons, options) ->
  if customization && customization.vest == true && customization.vest_buttons == numButtons
    options.fn @

Handlebars.registerHelper 'progressBarImage', (customization, lapel) ->
  if lapel == true && customization
    '<img class="selected completed" src="' + TR.ASSET_HOST + '/assets/icons/star-filled.png">'
  else if lapel == true
    '<img class="selected" src="' + TR.ASSET_HOST + '/assets/icons/star-filled.png">'
  else if customization
    '<img class="completed" src="' + TR.ASSET_HOST + '/assets/icons/star-stroke.png">'
  else
    '<img src="' + TR.ASSET_HOST + '/assets/icons/star-no-stroke.png">'

Handlebars.registerHelper 'imgSrc', (path) ->
  TR.ASSET_HOST + '/assets/' + path

Handlebars.registerPartial 'customizationCheckoutSuit', Handlebars.templates['_customization_checkout_suit.tmpl']
Handlebars.registerPartial 'customizationCheckoutShirt', Handlebars.templates['_customization_checkout_shirt.tmpl']


