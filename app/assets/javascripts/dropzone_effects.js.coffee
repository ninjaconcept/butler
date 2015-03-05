$ ->
  $(document).bind 'drop dragover', (e) ->
    e.preventDefault()
    return

  $(document).bind 'dragover', (e) ->
    dropZone = $('.dropzone')
    foundDropzone = undefined
    timeout = window.dropZoneTimeout

    unless timeout
      dropZone.addClass 'in'
    else
      clearTimeout timeout

    found = false
    node = e.target

    loop
      if $(node).hasClass('dropzone')
        found = true
        foundDropzone = $(node)
        break
      node = node.parentNode
      break unless node?

    dropZone.removeClass 'in hover'
    foundDropzone.addClass 'hover'  if found

    window.dropZoneTimeout = setTimeout(->
      window.dropZoneTimeout = null
      dropZone.removeClass 'in hover'
      return
    , 100)
    return
