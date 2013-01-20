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
    # rest of routes in pagesOnSlider object

  index: ->
    console.log 'index page'
    @slider.moveTo('index-page')

  about: ->
    console.log 'about page'
    @slider.moveTo('about-page')

  aboutOpenSource: ->
    console.log 'about open source'
    
    @slider.slider.addSlide('#about-open-source-page', 2)

    @slider.moveTo('about-open-source-page')

  benefits: ->
    console.log 'benefits page'
    @slider.moveTo('benefits-page')
    
  contact: ->
    console.log 'contact page'
    @slider.moveTo('contact-page')

  makingOf: ->
    $('#main-slider').hide()
    $('#making-of-page').show()






