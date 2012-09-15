class KrisMobile.AppRouter extends Backbone.Router

  pagesOnSlider:
    0:
      name: 'index'
      path: '!/'
    1:
      name: 'about'
      path: '!/about'
    2:
      name: 'benefits'
      path: '!/benefits'
    3:
      name: 'contact'
      path: '!/contact'

  constructor: ->
    _.each @pagesOnSlider, (item, index) =>
      @routes[item.path] = item.name

    super()
    @initMainSlider()

  initMainSlider: ->
    $slider = $('#main-slider').find('.flexslider').flexslider
      animation: 'slide'
      slideshow: false
      directionNav: false
      controlNav: false
      after: (slider) =>
        @navigate @pagesOnSlider[slider.currentSlide]['path'],
          trigger:
            false

    @slider = $slider.data('flexslider')

  routes:
    '': 'index'
    '!/making-of': 'makingOf'
    # rest of routes in pagesOnSlider object

  index: ->
    console.log 'index page'
    @moveToPage(0)

  about: ->
    console.log 'about page'
    @moveToPage(1)

  benefits: ->
    console.log 'benefits page'
    @moveToPage(2)
    
  contact: ->
    console.log 'contact page'
    @moveToPage(3)

  moveToPage: (target) ->
    $('#main-slider').show()
    $('.hidden-page').hide()
    @slider.flexAnimate(target, true)

  makingOf: ->
    $('#main-slider').hide()
    $('#making-of-page').show()

