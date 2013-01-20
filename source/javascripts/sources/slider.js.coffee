KrisMobile.Slider =

  pages:
    # 'page-id':
    #   functionName: router callback
    #   path: router url
   
    'index-page':
      functionName: 'index'
      path: '!/'

    'about-page':
      functionName: 'about'
      path: '!/about'
    
    'about-open-source-page':
      functionName: 'aboutOpenSource'
      path: '!/about-open-source'
    
    'benefits-page':
      functionName: 'benefits'
      path: '!/benefits'

    'contact-page':
      functionName: 'contact'
      path: '!/contact'


  init: (router) ->
    $slider = $('#main-slider').find('.flexslider').flexslider
      animation: 'slide'
      slideshow: false
      directionNav: false
      controlNav: false

      after: (slider) =>
        name = @getSlideName(slider.currentSlide)
        router.navigate @pages[name]['path'],
          trigger:
            false

    @slider = $slider.data('flexslider')


  getNumberOfSlide: (name) ->
    number = null

    _.each @slider.slides, (item, index) ->
      if item.id == name then number = index

    return number


  getSlideName: (number) ->
    name = @slider.slides[number].id


  moveTo: (target) ->
    if(typeof target == 'string')
      target = @getNumberOfSlide(target)

    @slider.flexAnimate(target, true)