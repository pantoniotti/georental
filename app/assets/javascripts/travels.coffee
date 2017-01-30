# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->

  # Handlers

  $('#file_upload').on 'click', 'btn-load-file', (ev) ->
    ev.preventDefault()

  $('#file_upload').on 'click', '.btn-default.clear', (ev) ->
    resetFileFields()
    setButtonState('')

  $('#file_upload').on 'keyup', '.file-name', (ev) ->
    setButtonState($(this).val())

  $('#file_upload').on 'change', '.file-name', (ev) ->
    val = $(this).val()
    # If empy clear file field
    if val == ''
      $('.file-Loader').val('')
    setButtonState(val)

  $('#file_upload').on 'change', '.file-Loader', (ev) ->
    val = $('.file-Loader').val()
    val = val.split(/\\/).pop()
    console.log val
    $('#file_upload .file-name').val(val)
    setButtonState(val)

  # Submit action
  $('.upload-container').on 'click', '.btn-submit', (ev) ->
    if ($(this)).attr('disabled')!= 'disabled'
      showProcessing()
#      fileInput = $('#file-Loader')
#      file = fileInput.files[0]
#      formData = new FormData
#      formData.append 'file', file
#      Ajax.call('POST', file.attr('action'), formData , )

  # Methods

  hasProperExtension = (filename) ->
    ext = filename.split(/[.]/).pop()
    if ['csv'].indexOf(ext) >= 0
      return true
    else
      return false

  isValid = (filename) ->
    if filename == ''
      $('.btn-warning').hide()
      return false
    $('.btn-warning').show()
    if hasProperExtension(filename)
      return true
    else
      return false

  resetFileFieds = () ->
    console.log 'Cleaning file fields'
    $('#file_upload .file-name').val('')
    $('#file_upload .file-Loader').val('')

  setButtonState = (filename) ->
    if isValid(filename)
      $('.btn-submit').removeAttr('disabled')
      $('.file-submit').removeAttr('disabled')
    else
      $('.btn-submit').attr('disabled', 'disabled')
      $('.file-submit').attr('disabled', 'disabled')

  showProcessing = ->
    $('.loader').fadeIn()

  resetFileFieds()
