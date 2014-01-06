# Global error handler
window.onerror = (message, file, line_number) ->
  if DEBUG?
    console.log "File: [" + line_number + "] - " + file + "\n\n" + message
  else
    alert "We are sorry, but something wrong ;-("

# Preload some images
window.preload = (images) ->
  for img in images
    (new Image()).src = img

$ ->
  # Preload images
  preload [
    '/assets/loaders/loader-s.gif',
    '/assets/loaders/arrows32x32.gif'
  ]

  $(document).ajaxError (event, jqxhr, settings, exception)->
    throw new Error jqxhr.responseText