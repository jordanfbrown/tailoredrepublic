class TR.Views.Referrals extends TR.Views.Base
  el: '.referrals'

  events:
    'submit form': 'submitForm'
    'click a.facebook': 'postToFacebook'
    'click a.twitter': 'postToTwitter'

  initialize: (options) ->
    @referralUrl = options.referralUrl
    mixpanel.track 'Went to Referrals Page'
    FB.init
      appId: '451190041628605'
      status: true
      cookie: true

  submitForm: ->
    mixpanel.track 'Shared Referral', { 'Method': 'Email'}
    TR.Analytics.trackEvent 'Referrals', 'Shared', 'Email'

  postToTwitter: (e) ->
    e.preventDefault()
    href = $(e.currentTarget).attr 'href'
    window.open href, 'Share on Twitter', 'left=20,top=20,width=500,height=500,toolbar=1,resizable=0'
    mixpanel.track 'Shared Referral', { 'Method': 'Twitter'}
    TR.Analytics.trackEvent 'Referrals', 'Shared', 'Twitter'

  postToFacebook: (e) ->
    e.preventDefault()
    mixpanel.track 'Shared Referral', { 'Method': 'Facebook'}
    TR.Analytics.trackEvent 'Referrals', 'Shared', 'Facebook'
    FB.ui
      method: 'feed'
      redirect_uri: 'https://www.tailoredrepublic.com/referrals'
      link: @referralUrl
      picture: 'http://s3.amazonaws.com/tailored-republic/assets/logos/big-logo.jpg'
      name: 'Tailored Republic'
      description: 'Tailored Republic lets you customize and build high quality made-to-measure suits, with a 100% satisfaction guarantee.'


