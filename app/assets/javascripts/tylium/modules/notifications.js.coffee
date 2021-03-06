document.addEventListener 'turbolinks:load', ->
  $dropdown = $('[data-behavior~=notifications-dropdown]')

  if $dropdown.length
    $dropdown.click (e) ->
      e.preventDefault()

      $.ajax
        url: $dropdown.attr('href') + '.js'
        dataType: 'script'
        method: 'GET'
        beforeSend: (e)->
          $container = $('[data-behavior~=notifications-dropdown] + div')
          if !$container.is(':visible')
            $container.html('<div class="loader"></div>')
          else
            # Don't send out ajax when hiding the dropdown
            return false
