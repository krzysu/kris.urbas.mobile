class KrisMobile.AppRouter extends Backbone.Router

  routes:
    "": "index"
    "/": "index"
    "/about": "about"
    "/benefits": "benefits"
    "/contact": "contact"

  index: ->
    console.log 'index page'
    $('.page').hide()
    $('#index-page').show()

  about: ->
    console.log 'about page'
    $('.page').hide()
    $('#about-page').show()

  benefits: ->
    console.log 'benefits page'
    $('.page').hide()
    $('#benefits-page').show()

  contact: ->
    console.log 'contact page'
    $('.page').hide()
    $('#contact-page').show()