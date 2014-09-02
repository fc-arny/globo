###
#  Popup Plugin
#  Make request and show popup
###
class AjaxPopup extends PluginBase
  # Defaults
  @defaultOptions:
    class: ''
    close_btn: '.popup__btn-close'


  # -------------------------------------------------- Constructor
  constructor:(@node, options = {}) ->
    super @node, options

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
    @$body.on 'click', '[data-popup]', (event) => @_showPopup(event)
    @$body.on 'keyup', (event) => @_onKeyUp(event)

    @$node.on 'click', @options.close_btn, (event)=> @_hidePopup(event)

  # -------------------------------------------------- Hide popup
  _hidePopup: ->
    console.log @cache
    if @cache is 'y'
      $(@source).appendTo('.dom-cache')

    @$node.hide()
    @$overlay.hide()
    @$body.removeClass 'no-scroll'


  # -------------------------------------------------- Show popup
  _showPopup: (event = null)->
    event.preventDefault()

    @$node.html '<div class="loader"></div>'
    el = event.currentTarget

    # TODO: merge option to one variable
    @title    = $(el).data 'title'
    @source   = $(el).data 'popup'
    @classes  = $(el).data 'classes'
    @cache    = $(el).data('cache')

    @$body.addClass 'no-scroll'
    @$node.show()
    @$overlay.show()

    if @source.indexOf('/') isnt -1
      $.ajax(
        url:       @source
        type:      'get'
        dataType:  'html'
        success: (response)=>
          @$node.html response

          @_renderContent(response, @title, @classes)
      )
    else
      @_renderContent('', @title, @classes)
      $(@source).appendTo('.popup__in').show()


  ###
  # Events
  ###

  # -------------------------------------------------- On key up
  _onKeyUp: (event) ->
    if event.keyCode == 27
      @_hidePopup()

  #
  _renderContent: (content, title = '', classes = '') ->
    html_content = """
<div class="popup #{classes}">
  <div class="popup__top">
    <buttom class="popup__btn-close">&times;</buttom>
    <div class="popup__title">#{title}</div>
  </div>
  <div class='popup__in'>#{content}</div>
</div>
"""
    @$node.html html_content

AjaxPopup.installAsjQueryPlugIn()