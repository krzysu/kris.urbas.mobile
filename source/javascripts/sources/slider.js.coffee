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

    'making-of-page':
      functionName: 'makingOf'
      path: '!/making-of'
      hidden: true


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
        @setBodyClass(name)

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
      name = target
      target = @getNumberOfSlide(target)

    # $(window).scrollTop(0)
    KrisMobile.AutoScroller.scrollTo 'body', =>
      @slider.flexAnimate(target, true)
      @removeHidden()
      @setBodyClass(name)


  removeHidden: ->
    currentSlideName = @getSlideName(@slider.currentSlide)

    _.each @pages, (item, index) =>
      if item.hidden? && item.hidden == true && currentSlideName != index
        number = @getNumberOfSlide(index)
        if number?
          @slider.removeSlide(number)

  setBodyClass: (name) ->
    $('body').removeClass().addClass(name)