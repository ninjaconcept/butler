getSearchModal = (options={}) ->
  $modal = $('#markdown-reference-modal')

  emptySearchResults = ->
    $modal.find('.js-search-results').empty()

  emptySearchBox = ->
    $modal.find('.js-search-field').val('')


  modal = {
    show: ->
      emptySearchResults()
      emptySearchBox()
      $modal.modal('show')
    hide: ->
      $modal.modal('hide')
  }

  callback          = options.callback || (->)
  url               = options.url
  rootJSONAttribute = options.rootAttribute


  registerSearchKeyEvent = ->
    $modal.find('.js-search-field').keyup (e) ->
      query = $('.js-search-field').val()

      jQuery.ajax
        url: url
        data:
          q: query
        dataType: 'json'
        success: (c) ->
          emptySearchResults()
          (
            # wrap in function, otherwise `article` is set to
            # the last element of the loop
            ( ->
              element = a
              $listItem = $("<tr><td>#{element.title}<small class='show'>#{element.type_name}</small></td><td><a>verlinken</a></td></tr>")

              $listItem.on 'click', ->
                callback element.id, element.type
                modal.hide()

              $modal.find('.js-search-results').append($listItem)
            )(a)
          ) for a in c[rootJSONAttribute]

  registerSearchKeyEvent() unless $modal.attr('data-keyup-registered')
  $modal.attr('data-keyup-registered', true)

  modal

$ ->
  editorOptions =
    autofocus: false
    savable: false
    onPreview: (e) ->
      # The first thing we do is sending a request to the server
      # in order to get properly rendered markdown back:
      # E.g. [foo](article:2) needs to be replaced with a link to that
      # article.
      # Since we don't want to wait for the request to finish before
      # displaying the user a rendered page, we fall back to client side
      # rendered markdown using `marked`.
      #
      # TODO: Rendering ![](image:1) leads to an `image:1` request which
      #       fails. Fix this by removing these constructs before showing
      #       the fallback version.

      jQuery.ajax
        url: '/api/render_markdown'
        data:
          content: e.getContent()
        dataType: 'html'
        success: (c) ->
          # Note: This class name is actually internal
          #       to bootstrap-markdown. If this fails,
          #       it's very likely due to us breaking
          #       encapsulation of the plugin here.
          #       In case there won't be a way to access
          #       the preview content in future versions
          #       we can still fallback to using synchronous
          #       requests.
          $('.md-preview').html(c)

      marked(e.getContent())
    additionalButtons: [
      [
        name: 'groupReferences'
        data: [
          {
            name: 'cmdPhoto'
            title: 'Photo einfügen'
            icon: 'glyphicon glyphicon-picture'
            callback: (e) ->
              selected = e.getSelection()
              content  = e.getContent()

              id = prompt('Photo-Id eingeben')
              e.replaceSelection("![](image:#{id})")
          },
          {
            name: 'cmdContentLink'
            title: 'Content verlinken'
            icon: 'glyphicon glyphicon-edit'
            callback: (e) ->
              selected = e.getSelection()
              content  = e.getContent()

              chunk = if selected.length == 0
                "Linkname hier eingeben"
              else
                selected.text

              modal = getSearchModal
                url: '/api/search'
                rootAttribute: 'contents'
                callback: (id, type) ->
                  if id != null && id != ''
                    if type == 'video'
                      e.replaceSelection("![](video:#{id})")
                    else
                      e.replaceSelection("[#{chunk}](#{type}:#{id})")
                    cursor = selected.start + 1
                    e.setNextTab('Linkname hier eingeben')
                    e.setSelection(cursor, cursor + chunk.length)

              modal.show()
          }
        ]
      ]
    ]

  $('.md-editor').markdown(editorOptions)
  delete editorOptions.additionalButtons
  $('.md-minimal-editor').markdown(editorOptions)
