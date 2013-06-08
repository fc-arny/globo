###
# Create jQueryPlugin
###
window.createjQueryPlugin = (Class) ->
  className = Class.toString().match(/^function ([^(]+)/)[1]
  pluginName = className.slice(0, 1).toLowerCase() + className.slice(1)
  $.fn[pluginName] = (options) ->
    args = undefined
    args = Array::slice.call(arguments, 1)
    @each ->
      obj = undefined
      obj = $(this).data(pluginName)
      unless obj instanceof Class
        obj = new Class($(this), options)
        $(this).data pluginName, obj
      obj[options].apply obj, args  if typeof options is "string"

