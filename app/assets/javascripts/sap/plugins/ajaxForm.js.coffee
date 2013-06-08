((window, $) ->
  ###
  # Base for all ajax form
  ###
  class AjaxForm

    InPoccess: false

    constructor:($node, options = {}) ->
      @$node = $node

      # Merge options with defaults
      defaults = {}
      @options = $.extend defaults, options

      @_bindEvents()

    # -------------------------------------------------- Bind events
    _bindEvents: ->
      @$node.on 'ajax:beforeSend',  (evt, xhr, settings) => @_onBeforeSend(evt, xhr, settings)
      @$node.on 'ajax:beforeComplete', (evt, xhr, status) => @_onComplete(evt, xhr, status)
      @$node.on 'ajax:success', (evt, data, status, xhr) => @_onSuccess(evt, data, status, xhr)
      @$node.on 'ajax:error', (evt, xhr, status, error) => @_onError(evt, xhr, status, error)

    # -------------------------------------------------- Before send request
    _onBeforeSend: (evt, xhr, settings) ->
      @_setInProgress()

    _onComplete: (evt, xhr, status) ->
      @_setInProgress(false)


    _onError: (evt, xhr, status, error) ->
      @_setInProgress(false)

    _onSuccess:  (evt, data, status, xhr) ->
      @_setInProgress(false)

    # -------------------------------------------------- Manage form state
    _setInProgress:(inProgress = true)->
      @InPoccess = inProgress

      if @InPoccess
        @$node.addClass('loading')
        @$node.find('input, textarea').attr('disabled', true)
      else
        @$node.removeClass('loading')
        @$node.find('input, textarea').attr('disabled', false)


  # Create plugin
  createjQueryPlugin AjaxForm

) window, jQuery