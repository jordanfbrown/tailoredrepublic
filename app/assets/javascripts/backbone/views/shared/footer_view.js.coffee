class TR.Views.Footer extends TR.Views.Base
  el: 'footer'

  events:
    'click h5.expandable': 'expandSection'
    'submit form': 'subscribeToNewsletter'

  initialize: ->
    $(window).resize =>
      if $(window).width() >= 768
        @$('ul').css('display', '')
        @$('h5 span').text '+'

  expandSection: (e) ->
    if $(window).width() < 768
      $target = $(e.currentTarget)
      $ul = $target.next 'ul:not(.always-show)'
      if $ul.is ':visible'
        $target.next('ul').hide 'slideDown'
        $target.find('span').text '+'
      else
        $target.next('ul').show 'slideUp'
        $target.find('span').text '-'

  subscribeToNewsletter: (e) ->
    $form = $(e.currentTarget)
    $.post($form.attr('action'), $form.serialize()).then(@subscribeSuccess, @subscribeFailure)
    false
    
  subscribeSuccess: =>
    @confirmDialog = new TR.Views.DialogModal
      text: 'A subscription request to become a Tailored Republic Affiliate has been sent to your e-mail. Please check your e-mail to confirm your subscription.',
      confirmText: 'Ok'
      confirmOnly: true

  subscribeFailure: =>
    @confirmDialog = new TR.Views.DialogModal
      text: 'We\'re sorry, but there was a problem adding your e-mail address to the TR Affiliate mailing list. Please try again, and if your problem persists, shoot us an e-mail at help@tailoredrepublic.com.',
      confirmText: 'Ok'
      confirmOnly: true

