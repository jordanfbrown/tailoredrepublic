describe 'Cart view', ->
  beforeEach ->
    affix('.carts div.line-item[data-product-id=1][data-customization-id=1][data-line-item-id=1][data-product-name=Suit] a.view-customizations span.arrow-right span.text')

  describe 'An empty cart', ->
    cart = null

    beforeEach ->
      cart = new TR.Views.Cart(lineItems: [])

    it 'should an initialize an empty collection of line items', ->
      expect(cart.lineItems).not.toBeNull()
      expect(cart.lineItems.length).toEqual(0)

  describe 'A cart with at least 1 item', ->
    cart = null

    beforeEach ->
      cart = new TR.Views.Cart(lineItems: [{"id":1,"price":429}])
      spyOn(cart, 'toggleCustomizations').andCallThrough()
      cart.delegateEvents()

    it 'should an initialize a non-empty collection of line items', ->
      expect(cart.lineItems).not.toBeNull()
      expect(cart.lineItems.length).toEqual(1)

    it 'should be able toggle customizations open and closed', ->
      $('a.view-customizations').click()
      expect(cart.toggleCustomizations).toHaveBeenCalled()

