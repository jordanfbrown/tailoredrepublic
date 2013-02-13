class TR.Views.OrderIndex extends TR.Views.Base
  el: '.orders'

  events:
    'click a.view-customizations': 'toggleCustomizations'

  toggleCustomizations: (e) ->
    TR.Views.Cart.prototype.toggleCustomizations.call @, e
