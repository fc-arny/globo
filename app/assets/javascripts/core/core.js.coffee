# Global error handler
window.onerror = (message, file, line_number) ->
  if DEBUG?
    console.log "File: [" + line_number + "] - " + file + "\n\n" + message
  else
    alert "We are sorry, but something wrong ;-("

$ ->
  $(document).ajaxError (event, jqxhr, settings, exception)->
    throw new Error jqxhr.responseText