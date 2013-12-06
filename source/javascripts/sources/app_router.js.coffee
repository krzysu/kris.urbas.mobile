class KrisMobile.AppRouter extends Backbone.Router

  constructor: ->
    @slider = KrisMobile.Slider

    _.each @slider.pages, (item, index) =>
      @routes[item.path] = item.functionName

    super()
    @slider.init(@)

  routes:
    '': 'index'
    # rest of routes in KrisMobile.Slider.pages object

  index: ->
    KrisMobile.Page.toggleImages()
    @slider.moveTo('index-page')

  about: ->
    @slider.moveTo('about-page')

  contact: ->
    @slider.moveTo('contact-page')

  aboutFrontEnd: ->
    @_createSlideAndMove('about-front-end-page')

  aboutGameDev: ->
    @_createSlideAndMove('about-game-dev-page')

  aboutStartups: ->
    @_createSlideAndMove('about-startups-page')

  aboutOpenSource: ->
    @_createSlideAndMove('about-open-source-page')

  aboutJobOffer: ->
    @_createSlideAndMove('about-job-offer-page')

  aboutMusic: ->
    @_createSlideAndMove('about-music-page')

  _createSlideAndMove: (name, basePageName = 'about-page') ->
    position = @slider.getNumberOfSlide( basePageName )
    @slider.slider.addSlide( $('#' + name).clone(), position + 1 )
    setTimeout(
      =>
        @slider.moveTo(name)
      ,
      200)
 








