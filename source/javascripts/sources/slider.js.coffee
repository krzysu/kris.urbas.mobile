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
      hidden: true
    
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

        @removeHidden()

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

    $(window).scrollTop(0)
    @slider.flexAnimate(target, true)

    @removeHidden()


  removeHidden: (currentSlideNumber) ->
    currentSlideName = @getSlideName(@slider.currentSlide)

    console.log 'before', @slider.currentSlide

    _.each @pages, (item, index) =>
      if item.hidden? && item.hidden == true && currentSlideName != index
        number = @getNumberOfSlide(index)
        if number?
          @slider.removeSlide(number)
        
    console.log 'after', @slider.currentSlide
