$ ->
  new KrisMobile.AppController()

class KrisMobile.AppController
  constructor: ->

    router = new KrisMobile.AppRouter()

    Backbone.history.start
      pushState: false

    @initGoToMenu()


  initGoToMenu: ->
    $('.go-to-menu').on 'click', (e) ->
      e.preventDefault()
      KrisMobile.AutoScroller.scrollTo $(e.currentTarget).attr('href')