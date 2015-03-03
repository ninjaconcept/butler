$ ->
  class FileUploadOptions
    constructor: (dropzone, form) ->
      @options =
        dropZone: $(dropzone)
        dataType: 'script'
        add: (e, data) ->
          types = /(\.|\/)(gif|jpe?g|png)$/i
          file = data.files[0]
          if types.test(file.type) || types.test(file.name)
            data.context = $(tmpl('template-upload', file))
            $(form).append(data.context)
            data.submit()
          else
            alert("#{file.name} is not a gif, jpeg, or png image file")
        progress: (e, data) ->
          if data.context
            progress = parseInt(data.loaded / data.total * 100, 10)
            bar = data.context.find('.progress-bar')
            bar.css('width', progress + '%')
        done: (e, data) ->
          data.context.fadeOut(400)

  # NOTE: adjust this for all upload fields you gonna need
  # FIXME: use a class here to trigger JS not ids
  $('#article-images-form').fileupload(new FileUploadOptions('#article-images-dropzone', '#article-images-form').options)

  $('#event-images-form').fileupload(new FileUploadOptions('#event-images-dropzone', '#event-images-form').options)

  $('#teaser-image-form').fileupload(new FileUploadOptions('#teaser-image-dropzone', '#teaser-image-form').options)

  $('#panorama-image-form').fileupload(new FileUploadOptions('#panorama-image-dropzone', '#panorama-image-form').options)

  $('.editable').editable(
    { emptytext: 'Leer' }
  )
