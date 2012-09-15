$ ->
  new KrisMobile.AppController()

class KrisMobile.AppController
  constructor: ->

    router = new KrisMobile.AppRouter()

    Backbone.history.start
      pushState: false

