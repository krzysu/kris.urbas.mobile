$ ->
  new KrisMobile.AppController()

class KrisMobile.AppController
  constructor: ->

    router = new KrisMobile.AppRouter()

    Backbone.history.start
      pushState: false

    @initAnchors()


  initAnchors: ->
    $(document).on 'click', 'a', (e) ->
      if $(e.currentTarget).hasClass('anchor') 
        e.preventDefault()
        KrisMobile.AutoScroller.scrollTo $(e.currentTarget).attr('href')