###
  Plugin for showing flash messages

  button    - selector of close button
  message   - selector of error/success/notice message
  container - selector of message's container
  classes   - classes for different messages types

  Example:
    # Init plugin
    fm = $('#flash-message').flashMessage()

    # Using
    fm.show 'Danger!!! Go away!', 'error'
###
class FlashMessage extends PluginBase
  @defaultOptions:
    button   : '.alert__close'
    message  : '.alert__message'
    container: '.alert'
    classes:
      error   : 'alert_error'
      warning : 'alert_warning'
      notice  : 'alert_notice'
      success : 'alert_success'

  # -------------------------------------------------- Constructor
  constructor:(@node, options = {}) ->
    super @node, options

    @_cache()
    @_bindEvents()
    @_init()

  # -------------------------------------------------- Show message
  show: (message, type = 'notice') ->
    @$message.html message
    @$container.addClass @options.classes[type]
    @$container.show()
    @$container.animate {opacity: 1}, 500

    @timer = setTimeout(=>
      @_close()
    , 3000)

  # -------------------------------------------------- Init plugin
  _init: ->
    # hide message if it's exist
    @timer = setTimeout(=>
      @_close()
    , 3000)

  # -------------------------------------------------- Cache objects
  _cache: ->
    @$close     = @$node.find @options.button
    @$message   = @$node.find @options.message
    @$container = @$node.find @options.container

  # -------------------------------------------------- Bind events
  _bindEvents: ->
    @$node.on 'ajaxComplete', (event, request) => @_onAjaxComplete(event, request)

    @$close.on 'click', (event) => @_onCloseClick(event)
    @$container.on 'mouseenter', (event) => @_onContainerMouseEnter(event)
    @$container.on 'mouseleave', (event) => @_onContainerMouseLeave(event)

  # -------------------------------------------------- Close
  _close: (animateTime = 1000)->
    @$container.animate {opacity: 0}, animateTime, =>
      @$container.hide()
      @$container.css 'opacity', 1
      @$message.html ''

  ###
  # Events
  ###

  # -------------------------------------------------- Click on 'close' button
  _onCloseClick: (event) ->
    @_close(100)

  # -------------------------------------------------- On Ajax Complete
  _onAjaxComplete: (event, request) ->
    message = request.getResponseHeader 'X-Message'
    type = request.getResponseHeader 'X-Message-Type'

    if message?
      @$node.flashMessage 'show', decodeURIComponent(message), type


  # -------------------------------------------------- Don't hide message when mouseenter event
  _onContainerMouseEnter:(event) ->
    clearTimeout @timer
    @$container.stop()
    @$container.css 'opacity', 1

  # -------------------------------------------------- Start new timer when mouseleave event
  _onContainerMouseLeave:(event) ->
    @timer = setTimeout(=>
      @_close()
    , 3000)

FlashMessage.installAsjQueryPlugIn()
