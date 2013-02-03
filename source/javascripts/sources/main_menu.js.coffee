KrisMobile.MainMenu =
  init: ->
    @$menu = $('#main-menu')
    @$trigger = $('.go-to-menu')
    
    @initEvent()

  initEvent: ->
    @$trigger.on 'click', (e) =>
      e.preventDefault()
      
      if @$trigger.hasClass('on')
        @hide()
      else
        @show()

  hide: ->
    @$menu.slideUp('fast')
    @$trigger.removeClass('on')

  show: ->
    @$menu.slideDown('fast')
    @$trigger.addClass('on')