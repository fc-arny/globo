###
# Base for all ajax form
###
class AjaxForm extends PluginBase

  InPoccess: false

  # Defaults
  @defaultOptions:
    success : ->
    fail    : ->
    error   : ->
    field:
      wrapper : 'div'
      error   : 'error'
    error:
      separator : ';<br/>'
      message   : 'error-message'

  # When create plugin
  constructor:(@node, options = {}) ->
    super @node, options

    @_bindEvents()

  # Init and updae plugin options
  initialize: (@options)->
    super @options


  # -------------------------------------------------- Bind events
  _bindEvents: ->
    @$node.on 'ajax:beforeSend',  (evt, xhr, settings) => @_onBeforeSend(evt, xhr, settings)
    @$node.on 'ajax:beforeComplete', (evt, xhr, status) => @_onComplete(evt, xhr, status)
    @$node.on 'ajax:success', (evt, response, status, xhr) => @_onSuccess(evt, response, status, xhr)
    @$node.on 'ajax:error', (evt, xhr, status, error) => @_onError(evt, xhr, status, error)

  # -------------------------------------------------- Before send request
  _onBeforeSend: (evt, xhr, settings) ->
    @_clearErrors()
    @_setInProgress()

  _onComplete: (evt, xhr, status) ->
    @_setInProgress false


  _onError: (evt, xhr, status, error) ->
    @_setInProgress false
    throw new Error error

  # -------------------------------------------------- Success AJAX request
  _onSuccess:  (evt, response, status, xhr) ->
    @_setInProgress false

    if response
      if response.status is Sap.API_STATUS_SUCCESS
        @options.success response
      else if response.status is Sap.API_STATUS_FAIL
        @_showErrors response.data.errors
      else
        throw new Error('Response error')
    else
      throw new Error('No response')

  # -------------------------------------------------- Show form errors by field
  _showErrors: (errors) ->
    for form of errors
      for input of errors[form]
        message = errors[form][input].join @options.error.separator

        $input  = @$node.find("[name='#{form}[#{input}]']")
        $field  = $input.closest(@options.field.wrapper)

        $field.addClass @options.field.error
        $message = $field.find ".#{@options.error.message}"

        unless $message.length
          $message = $('<div />').addClass @options.error.message
          $message.insertAfter $input

        $message.html message

  # -------------------------------------------------- Clear all form errors
  _clearErrors: ->
    @$node.find(".#{@options.field.error}").removeClass @options.field.error
    @$node.find(".#{@options.error.message}").html ''


  # -------------------------------------------------- Manage form state
  _setInProgress:(inProgress = true)->
    @InPoccess = inProgress

    if @InPoccess
      @$node.addClass('loading')
      @$node.find('input, textarea').attr('disabled', true)
    else
      @$node.removeClass('loading')
      @$node.find('input, textarea').attr('disabled', false)


AjaxForm.installAsjQueryPlugIn()