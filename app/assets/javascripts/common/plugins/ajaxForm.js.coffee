###
# Base for all ajax form
# Options:
#   name - name of params array. For ex.: user[name], user[phone], here 'user' is 'name'
#   field:
#     wrapper   - class wrapping input, error, etc
#     has_error - class add to 'wrapper' if validation failed
#   error:
#     separator - error messages separator
#     message   - class for error html-element
#     direction - corner position in error bubble
#
#
#
#
###
class AjaxForm extends PluginBase

  InPoccess: false

  # Defaults
  @defaultOptions:
    success : ->
    fail    : ->
    error   : ->
    form_name: 'form'
    field:
      wrapper   : 'label'
      has_error : 'has-error'
    error:
      separator : ';<br/>'
      message   : 'label__error'
      direction : 'left'
    selectors:
      submit_btn: '.btn'


  # When create plugin
  constructor:(@node, options = {}) ->
    super @node, options
#    console.log options
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
    @_setInProgress(evt.currentTarget)

  _onComplete: (evt, xhr, status) ->
    @_setInProgress evt.currentTarget, false


  _onError: (evt, xhr, status, error) ->
    @_setInProgress false
    throw new Error error

  # -------------------------------------------------- Success AJAX request
  _onSuccess:  (evt, response, status, xhr) ->
    @_setInProgress false

    if response
      if response.status is API_STATUS_SUCCESS
        @options.success response
      else if response.status is API_STATUS_FAIL
        @_showErrors response.data.errors
      else
        throw new Error('Response error')
    else
      throw new Error('No response')

  # -------------------------------------------------- Show form errors by field
  _showErrors: (errors) ->
    for input of errors
      # Show only first error
      message = "<span>#{errors[input][0]}</span>"

      $input  = @$node.find("[name='#{@options.form_name}[#{input}]']")
      $field  = $input.closest( ".#{@options.field.wrapper}")

      $field.addClass @options.field.has_error
      $message = $field.find ".#{@options.error.message}"

      unless $message.length
        $message = $('<span />').addClass @options.error.message
        if @options.error.direction is 'right'
          $message.addClass 'label__error_right'
        $message.appendTo $field

      $message.html message

  # -------------------------------------------------- Clear all form errors
  _clearErrors: ->
    @$node.find(".#{@options.field.has_error}").removeClass @options.field.has_error
    @$node.find(".#{@options.error.message}").html ''


  # -------------------------------------------------- Manage form state
  _setInProgress:(inProgress = true)->
    @InPoccess = inProgress

    if @InPoccess
      @$node.find(@options.selectors.submit_btn).addClass('load')
      @$node.find('input, textarea').attr('disabled', true)
    else
      @$node.find('.load').removeClass('load')
      @$node.find('input, textarea').attr('disabled', false)


AjaxForm.installAsjQueryPlugIn()
