# mainly helpers that don't fit to other objects
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

  setEmail: ->
    email_reversed = 'moc.liamg@lp.usyzrk'
    email_correct = email_reversed.split('').reverse().join('')
    email_box = document.getElementById('set-email')
    email_box.href = 'mailto:' + email_correct
