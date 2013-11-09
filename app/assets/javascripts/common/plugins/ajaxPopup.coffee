###
#  Popup Plugin
#  Make request and show popup
###
class AjaxPopup extends PluginBase
  # Defaults
  @defaultOptions:
    class: ''
    loader: '/assets/loaders/arrows32x32.gif'
    close_btn: '.popup__btn-close'


  # -------------------------------------------------- Constructor
  constructor:(@node, options = {}) ->
    super @node, options

    # Preload loader
    loaderImage = new Image()
    loaderImage.src = @options.loader

    @_cache()
    @_bindEvents()


  # -------------------------------------------------- Init and updae plugin options
  initialize: (@options)->
    super @options

  # -------------------------------------------------- Hide popup
  hide: =>
    @_hidePopup()

  show: =>
    @_showPopup()

  # -------------------------------------------------- Cache objects
  _cache: ->
    @$overlay  = $ '.overlay'
    @$body     = $ 'body'


  # -------------------------------------------------- Bind events
  _bindEvents: ->
    @$body.on 'click', '[data-popup=true]', (event) => @_showPopup(event)
    @$body.on 'keyup', (event) => @_onKeyUp(event)

    @$node.on 'click', @options.close_btn, (event)=> @_hidePopup(event)
    @$overlay.on 'click', (event) => @_hidePopup(event)

  # -------------------------------------------------- Hide popup
  _hidePopup: ->
    @$node.hide()
    @$overlay.hide()
    @$body.removeClass 'no-scroll'


  # -------------------------------------------------- Show popup
  _showPopup: (event)->
    event.preventDefault()
    @$node.html ''
    el = event.currentTarget

    _url    = $(el).attr 'url'

    @$body.addClass 'no-scroll'
    @$node.show()
    @$overlay.show()

    background = @$node.css 'background'
    @$node.css "background", "url(#{@options.loader}) no-repeat center center transparent"

    $.ajax(
      url:       _url
      type:      'get'
      dataType:  'html'
      success: (response)=>
        @$node.css 'background', background
        @$node.html response
    )

  ###
  # Events
  ###

  # -------------------------------------------------- On key up
  _onKeyUp: (event) ->
    if event.keyCode == 27
      @_hidePopup()


AjaxPopup.installAsjQueryPlugIn()