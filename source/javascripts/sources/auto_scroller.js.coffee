KrisMobile.AutoScroller =
  scrollTo: (el, afterCallback) ->
    destination = $(el).offset().top - 20

    $("html:not(:animated), body:not(:animated)").animate
      scrollTop: destination
    ,
      duration: 'fast'
      complete: ->
        if afterCallback? and typeof afterCallback == 'function'
          afterCallback()