KrisMobile.Slider =

  pages:
    # 'page-id':
    #   functionName: router callback
    #   path: router url
    #   hidden: dynamically created
   
    'index-page':
      functionName: 'index'
      path: '!/'

    'about-page':
      functionName: 'about'
      path: '!/about'

    'about-front-end-page':
      functionName: 'aboutFrontEnd'
      path: '!/about-front-end'
      hidden: true
    
    'about-open-source-page':
      functionName: 'aboutOpenSource'
      path: '!/about-open-source'
      hidden: true

    'about-startups-page':
      functionName: 'aboutStartups'
      path: '!/about-startups'
      hidden: true

    'about-job-offer-page':
      functionName: 'aboutJobOffer'
      path: '!/about-job-offer'
      hidden: true

    'about-music-page':
      functionName: 'aboutMusic'
      path: '!/about-music'
      hidden: true

    'contact-page':
      functionName: 'contact'
      path: '!/contact'


  init: (router) ->
    $slider = $('#main-section').find('.flexslider').flexslider
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