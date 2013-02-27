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

Handlebars.registerHelper 'eachProperty', (context, options) ->
  count = 0
  ret = ''
  for key, value of context
    ret = ret + options.fn(property: key, value: value, index: count)
    count++
  ret

Handlebars.registerHelper 'decimalToInteger', (decimal) ->
  parseInt decimal

Handlebars.registerHelper 'ifeq', (a, b, options) ->
  if a == b
    options.fn @
  else
    options.inverse @
    
Handlebars.registerHelper 'numColumns', (context) ->
  length = _.keys(context).length
  switch length
    when 1 then 'twelve'
    when 2 then 'six'
    when 3 then 'four'
    when 4 then 'three'

Handlebars.registerHelper 'ifNotEq', (a, b, options) ->
  if a == b
    options.inverse @
  else
    options.fn @

Handlebars.registerHelper 'titleize', TR.titleize

Handlebars.registerHelper 'titleizeWithNumbers', (value) ->
  switch value
    when 'false' then 'No'
    when 'true' then 'Yes'
    when '0' then 'None'
    when '1' then 'One'
    when '2' then 'Two'
    when '3' then 'Three'
    when '4' then 'Four'
    when '5' then 'Five'
    else TR.titleize value

Handlebars.registerHelper 'imgSrc', TR.imgSrc

Handlebars.registerPartial 'customizationCheckoutSuit', Handlebars.templates['_customization_checkout_suit.hbs']
Handlebars.registerPartial 'customizationCheckoutShirt', Handlebars.templates['_customization_checkout_shirt.hbs']


