#= require jquery
#= require jquery_ujs

#= require jquery-fileupload/basic
#= require jquery-fileupload/vendor/tmpl
#= require attachments
#= require dropzone_effects

#= require bootstrap-sprockets

#= require moment
#= require moment/de
#= require bootstrap-datetimepicker

#= require marked.min
# http://github.com/toopay/bootstrap-markdown
#= require bootstrap-markdown

# NOTE: requires api controller to render markdown preview.
#       see echo-live for code
# require markdown_setup

#= require flyout
#= require cocoon

# NOTE: gem's not getting loaded for unknown reason
# require editable/bootstrap-editable
# require editable/rails


#= require jquery.autogrow
#= require clndr
#= require json3
#= require underscore


$ ->
  $('.datepicker').datetimepicker
    locale: 'de'
    pick12HourFormat: false
    minuteStepping: 15

  $('textarea').autoGrow()

  $(document).on "click", ".panel-toggle-btn", ->
    $(this).closest(".panel").toggleClass "closed"
