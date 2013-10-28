###
#  Popup Plugin
#  Make request and show popup
###
class AjaxPopup extends PluginBase
  # Defaults
  @defaultOptions:
    class: ''
    loader: '/assets/loaders/arrows32x32.gif'


  # -------------------------------------------------- Constructor
  constructor:(@node, options = {}) ->
    super @node, options

    @_cache()
    @_bindEvents()


  # -------------------------------------------------- Init and updae plugin options
  initialize: (@options)->
    super @options

  # -------------------------------------------------- Cache objects
  _cache: ->
    @$overlay  = $ '.overlay'
    @$popup    = $ '.popup'
    @$body     = $ 'body'


  # -------------------------------------------------- Bind events
  _bindEvents: ->
    @$node.on 'click', (event) => @_showPopup(event)


  # -------------------------------------------------- Show popup
  _showPopup: (event)->
    event.preventDefault()

    _url    = @$node.attr 'url'
    _class  = @$node.attr 'popup_class'

    @$body.addClass 'no-scroll'
    @$popup.show()
    @$overlay.show()

    unless @$popup.hasClass _class
      @$popup.addClass _class

      background = @$popup.css 'background'
      @$popup.css "background", "url(#{@options.loader}) no-repeat center center #ffffff"

      $.ajax(
        url:       _url
        type:      'get'
        dataType:  'html'
        success: (response)=>
          @$popup.css 'background', background
          @$popup.html response
      )

AjaxPopup.installAsjQueryPlugIn()