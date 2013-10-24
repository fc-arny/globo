###
#  Popup Plugin
#  Make request and show popup
###
class AjaxPopup extends PluginBase
  # Defaults
  @defaultOptions:
    class: ''
    loader: '/assets/loader-fruit.gif'


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

    @$popup.addClass _class

    _self   = @

    $.ajax(
      url:       _url
      type:      'get'
      dataType:  'html'
      success: (response)->
        _self.$popup.html response
    )

AjaxPopup.installAsjQueryPlugIn()