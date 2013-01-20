class KrisMobile.AppRouter extends Backbone.Router

  constructor: ->
    @slider = KrisMobile.Slider

    _.each @slider.pages, (item, index) =>
      @routes[item.path] = item.functionName

    super()
    @slider.init(@)

  routes:
    '': 'index'
    '!/making-of': 'makingOf'
    # rest of routes in KrisMobile.Slider.pages object

  index: ->
    @slider.moveTo('index-page')

  about: ->
    @slider.moveTo('about-page')

  aboutOpenSource: ->
    position = @slider.getNumberOfSlide('about-page')
    @slider.slider.addSlide( $('#about-open-source-page').clone(), position + 1 )
    setTimeout(
      =>
        @slider.moveTo('about-open-source-page')
      ,
      200)
    # @slider.moveTo('about-open-source-page')

  benefits: ->
    @slider.moveTo('benefits-page')
    
  contact: ->
    @slider.moveTo('contact-page')

  makingOf: ->
    @slider.slider.addSlide( $('#making-of-page').clone(), @slider.slider.currentSlide )
    setTimeout(
      =>
        @slider.moveTo('making-of-page')
      ,
      200)






