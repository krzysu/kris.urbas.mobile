$ ->
  new KrisMobile.AppController()

class KrisMobile.AppController
  constructor: ->

    KrisMobile.Tracking.init()
    KrisMobile.Page.initAnchors()
    KrisMobile.Page.toggleImages()
    KrisMobile.MainMenu.init()
    KrisMobile.Feedback.init()

    router = new KrisMobile.AppRouter()

    Backbone.history.start
      pushState: false



