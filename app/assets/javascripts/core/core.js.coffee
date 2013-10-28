# Global error handler
window.onerror = (message, url, line_number) ->
  if DEBUG
    alert "Url: " + url + "\nLine: " + line_number + "\nDetails: " + message
  else
    alert "We are sorry, but something wrong ;-("

$ ->
  $(document).ajaxError (event, jqxhr, settings, exception)->
    throw new Error jqxhr.responseText