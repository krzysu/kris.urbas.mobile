$ ->
  new KrisMobile.AppController()

class KrisMobile.AppController
  constructor: ->

    @initAnchors()
    @switchImages()
    KrisMobile.MainMenu.init()

    router = new KrisMobile.AppRouter()

    Backbone.history.start
      pushState: false


  initAnchors: ->
    $(document).on 'click', 'a', (e) ->
      if $(e.currentTarget).hasClass('anchor') 
        e.preventDefault()
        KrisMobile.AutoScroller.scrollTo $(e.currentTarget).attr('href')

  switchImages: ->
    random0or1 = Math.round(Math.random() * 1)

    if random0or1 == 0
      $('#index-page .image').addClass('alt')
