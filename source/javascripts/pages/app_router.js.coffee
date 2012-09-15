class KrisMobile.AppRouter extends Backbone.Router

  pages:
    0: "!/"
    1: "!/about"
    2: "!/benefits"
    3: "!/contact"

  initialize: ->
    @initMainSlider()

  initMainSlider: ->
    $slider = $('#main-slider').find('.flexslider').flexslider
      animation: 'slide'
      slideshow: false
      directionNav: false
      controlNav: false
      after: (slider) =>
        @navigate @pages[slider.currentSlide],
          trigger:
            false

    @slider = $slider.data('flexslider')

  routes:
    "": "index"
    "!/": "index"
    "!/about": "about"
    "!/benefits": "benefits"
    "!/contact": "contact"

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
    # if target > @slider.currentSlide then @slider.direction = "next" else @slider.direction = "prev"
    @slider.flexAnimate(target, true)

