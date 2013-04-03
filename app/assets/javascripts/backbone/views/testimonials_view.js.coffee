class TR.Views.Testimonials extends TR.Views.Base
  el: '.testimonials'

  initialize: ->
    @$('div.pagination').hide()
    @setUpInfiniteScroll()

  setUpInfiniteScroll: ->
    @$('.testimonials-row').infinitescroll
      navSelector: 'div.pagination'
      nextSelector: 'div.pagination a.next_page'
      itemSelector: 'div.testimonial'
      appendCallback: false
      loading:
        img: TR.imgSrc 'ajax-loader.gif'
        finishedMsg: "You've reached the end of the testimonials."
        msgText: ''
    , @appendEls

  appendEls: ($els) =>
    $rows = @$('.testimonials-row .four')
    $els.each (index, el) =>
      $rows.eq(index % 3).append el