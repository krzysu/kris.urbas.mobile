$ ->
  new KrisMobile.AppController()

class KrisMobile.AppController
  constructor: ->
    console.log('scripts inited')

    router = new KrisMobile.AppRouter()

    Backbone.history.start
      pushState: false
