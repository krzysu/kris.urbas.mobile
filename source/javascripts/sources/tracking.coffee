KrisMobile.Tracking =
  init: ->
    tracker = new KrisMobile.GoogleEventTracker('flow')
    tracker.initElements(@getTrackedElements())

  getTrackedElements: ->
    [
      name: 'clicked'
      selector: 'a'
      label: (e) ->
        $el = $(e.currentTarget)
        label = ''

        if $el.attr('id')?
          label += 'ID: ' + $el.attr('id') + ' | '

        if $el.attr('class')?
          label += 'CLASS: ' + $el.attr('class') + ' | '

        if $.trim( $el.text() ).length > 0
          label += 'TEXT: ' + $.trim( $el.text() ) + ' | '

        if $el.attr('href')?
          label += 'HREF: ' + $el.attr('href') + ' | '

        return label
    ]

