$ = jQuery

# An abstract class that provide jQuery plugin setup functionalities.
class window.PluginBase

  # Redefine this dictionary to specify default options
  @defaultOptions: {}

  # The default constructor calls the initialize method and set the jQuery element.
  # Remember to call super in subclasses if you want to maintain this behaviour.
  constructor: (@node, options) ->
    @$node = @node
    @initialize options

  # Method to initialize the plugin instance with the given options
  # This method could be called
  initialize: (@options) ->

  # Install a class as a jQuery plugin. Assuming that myClass extends PluginBase it can than be installed with:
  # myClass.installAsjQueryPlugIn()
  @installAsjQueryPlugIn: (pluginName = @name) ->
    pluginClass = @
    $.fn[pluginName] = (options = {}, args...) ->
      if $.type(options) is "object"
        _defaults = $.extend true, {}, pluginClass.defaultOptions
        options = $.extend true, _defaults, options

      return @each () ->
        $this = $(this)
        instance = $this.data pluginName
        if instance?
          if $.type(options) is "string"
            instance[options].apply instance, args
          else if instance.initialize?
            instance.initialize.apply instance, [options].concat args
        else
          plugin = new pluginClass $this, options, args...
          $this.data pluginName, plugin
          $this.addClass pluginName
          $this.bind "destroyed.#{pluginName}", () ->
            $this.removeData pluginName
            $this.removeClass pluginName
            $this.unbind pluginName
            plugin.destructor()
          plugin