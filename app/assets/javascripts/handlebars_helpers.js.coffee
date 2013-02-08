Handlebars.registerHelper 'uppercaseFirst', TR.uppercaseFirst

Handlebars.registerHelper 'ifLengthThree', (array, options) ->
  if array.length == 3
    options.fn @

Handlebars.registerHelper 'ifGreaterThan', (first, second, options) ->
  if first > second
    options.fn @
  else
    options.inverse @

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

# Takes a string in the form "an-example-string" and returns "An Example String"
Handlebars.registerHelper 'titleize', (str) ->
  (_.map str.split('-'), TR.uppercaseFirst).join ' '

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
  TR.ASSET_HOST + '/assets/' + (if TR.ENVIRONMENT == 'production' || TR.ENVIRONMENT == 'staging' then TR.ASSET_DIGESTS[path] else path)

Handlebars.registerPartial 'customizationCheckoutSuit', Handlebars.templates['_customization_checkout_suit.tmpl']
Handlebars.registerPartial 'customizationCheckoutShirt', Handlebars.templates['_customization_checkout_shirt.tmpl']


