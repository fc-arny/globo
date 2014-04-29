# Global error handler
window.onerror = (message, file, line_number) ->
  if DEBUG?
    error_count = 10
    message = "File: [" + line_number + "] - " + file + "\n\n" + message
  else
    error_count = 1
    message =  "We are sorry, but something wrong"

  $container = $('.js-errors')
  $item = $('<div />').addClass('js-error-item').html message

  $container.prepend $item
  $container.find('.js-error-item:last').remove() if $container.find('.js-error-item').length > error_count

  setTimeout(->
    $('.js-errors').animate(
      opacity: 0
    , 1000, ->
      $('.js-errors').find('.js-error-item').remove()
    )
  , 1000 * error_count)

$ ->
  $(document).ajaxError (event, jqxhr, settings, exception)->
    throw new Error jqxhr.responseText

  # JS errors
  $('.js-errors').on 'dblclick', '.js-error-item', (e)->
    $(e.currentTarget).remove()
