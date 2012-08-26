class KrisMobile.AppRouter extends Backbone.Router

  routes:
    "": "index"
    "/about": "about"
    "/benefits": "benefits"
    "/contact": "contact"

  index: ->
    console.log 'index page'

  about: ->
    console.log 'about page'

  benefits: ->
    console.log 'benefits page'

  contact: ->
    console.log 'contact page'
