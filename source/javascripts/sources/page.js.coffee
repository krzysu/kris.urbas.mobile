KrisMobile.Page =
  show: ->
    $('#content-loader').fadeOut ->
      $(this).remove()

  toggleImages: ->
    random0or1 = Math.round(Math.random() * 1)
    $image = $('#index-page .image')

    if random0or1 == 0
      $image.addClass('alt')
    else
      $image.removeClass('alt')

  initAnchors: ->
    $(document).on 'click', 'a.anchor', (e) ->
      e.preventDefault()
      KrisMobile.AutoScroller.scrollTo $(e.currentTarget).attr('href')