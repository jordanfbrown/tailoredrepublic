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

Handlebars.registerHelper 'titleize', TR.titleize

Handlebars.registerHelper 'imgSrc', (path) ->
  TR.ASSET_HOST + '/assets/' + (if TR.ENVIRONMENT == 'production' || TR.ENVIRONMENT == 'staging' then TR.ASSET_DIGESTS[path] else path)

Handlebars.registerPartial 'customizationCheckoutSuit', Handlebars.templates['_customization_checkout_suit.tmpl']
Handlebars.registerPartial 'customizationCheckoutShirt', Handlebars.templates['_customization_checkout_shirt.tmpl']


