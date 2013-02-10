KrisMobile.Feedback = 
  init: ->
    @firebase = new Firebase('https://myviews.firebaseio.com/')

    @$form = $('#feedback-form')
    @$textarea = @$form.find('textarea')
    @$error = @$form.find('.error-msg')
    @$success = @$form.find('.success-msg')

    @initEvents()

  initEvents: ->

    @$form.find('.button').on 'click', (e) =>
      e.preventDefault()

      message = $.trim @$textarea.val()
      
      if message.length > 4
        @firebase.push
          message: message
          time: new Date().toString()
          
        @showSuccess()

      else
        @showError()
        @hideSuccess()

    @$textarea.on 'keypress', (e) =>
      @hideError()
        

  showError: ->
    @$error.show()
    @$textarea.addClass('with-error')

  hideError: ->
    @$error.hide()
    @$textarea.removeClass('with-error')

  showSuccess: ->
    @$textarea.val('')
    @$success.show()

  hideSuccess: ->
    @$success.hide()
