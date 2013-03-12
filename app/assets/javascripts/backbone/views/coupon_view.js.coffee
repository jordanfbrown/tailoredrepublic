class TR.Views.Coupon extends TR.Views.Base
  el: '.coupons'

  events:
    'change #coupon_apply_to_type': 'changeApplyTo'
    'submit form': 'submitForm'

  initialize: ->
    @$('#coupon_begin_date').datepicker dateFormat: 'yy-mm-dd'
    @$('#coupon_end_date').datepicker dateFormat: 'yy-mm-dd'
    _.delay => @$('#coupon_apply_to_type').trigger 'change'

  changeApplyTo: (e) ->
    value = $(e.currentTarget).val()

    if value == 'product'
      @$('#apply-to-product').show()
      @$('#apply-to-group').hide()
    else if value == 'order'
      @$('#apply-to-product').hide()
      @$('#apply-to-group').hide()
    else
      @$('#apply-to-group').show()
      @$('#apply-to-product').hide()

    @$('.apply-to-group-label').text TR.uppercaseFirst value


  submitForm: (e) ->
    applyToType = @$('#coupon_apply_to_type').val()

    if applyToType == 'product'
      @$('#apply-to-group').remove()
    else if applyToType == 'order'
      @$('#coupon_apply_to_group').val ''
    else
      @$('#apply-to-product').remove()
