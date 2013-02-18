class KrisMobile.GoogleEventTracker
  constructor: (@pageName) ->

  report: (name, label, value) ->
    unless value?
      _gaq.push ['_trackEvent', @pageName, name, label.toString()]
      # console.log('_gaq.push', @pageName + ' | ', name + ' | ', label.toString())
    else
      _gaq.push ['_trackEvent', @pageName, name, label.toString(), parseInt(value, 10)]
      # console.log('_gaq.push', @pageName + ' | ', name + ' | ', label.toString() + ' | ', parseInt(value, 10))

  initElements: (elements) ->
    $.each elements, (index, item) =>
      
      unless item.event? then item.event = 'click'

      switch item.event
        when 'click'
          $(document).on 'click.eventTracker', item.selector, (e) =>
            @report(item.name, item.label(e), item.value(e) if item.value?)

        when 'keypress'
          $(document).on 'keypress.eventTracker', item.selector, (e) =>
            code = if e.keyCode then e.keyCode else e.which
            if code == 13 
              @report(item.name, item.label(e), item.value(e) if item.value?)

        when 'change'
          $(document).on 'change.eventTracker', item.selector, (e) =>
            @report(item.name, item.label(e), item.value(e) if item.value?)



