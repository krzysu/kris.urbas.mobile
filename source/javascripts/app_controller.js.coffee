$ ->
  new KrisMobile.AppController()

class KrisMobile.AppController
  constructor: ->

    @initAnchors()
    KrisMobile.MainMenu.init()

    router = new KrisMobile.AppRouter()

    Backbone.history.start
      pushState: false


  initAnchors: ->
    $(document).on 'click', 'a', (e) ->
      if $(e.currentTarget).hasClass('anchor') 
        e.preventDefault()
        KrisMobile.AutoScroller.scrollTo $(e.currentTarget).attr('href')
