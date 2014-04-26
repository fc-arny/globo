###
  Base for all ajax form
  ___________________________________________
  Options:
    field:
      wrapper_class   - class wrapping input, error, etc
      has_error_class - class add to 'wrapper' if validation failed
    error:
      message_class   - class for error html-element
    selectors:
      submit_btn      - submit button

  ___________________________________________
  Filters:
    Inputs may have saome filters setup via data-attribute (ex.: <input data-filters="digits, regexp" />).
    This mean that before validation will call method '_flter*FilterName*' (ex.: _filterDigits, _filterRegexp etc.).
    If you need pass params to filter you should add data-attribute: data-filter-*filterName*="param" (ex.: data-filter-regexp="/A-Z0-9/")

###
class AjaxForm extends PluginBase

  API_STATUS_SUCCESS  = 'success' # Evething ok
  API_STATUS_FAIL     = 'fail'    # Not valid data
  API_STATUS_ERROR    = 'error'   # Fatal/unexpected errors

  InProgress: false
  HasErrors: false

  # Defaults
  @defaultOptions:
    onSuccess : ->
    onFail    : ->
    onError   : ->
    showErrors: true
    field:
      wrapper_class   : 'label'
      has_error_class : 'has-error'
    error:
      message_class   : 'help-block'
    selectors:
      submit_btn: '.btn'


  # When create plugin
  constructor:(@node, options = {}) ->
    super @node, options
    @_cache()
    @_bindEvents()

  # Init and updae plugin options
  initialize: (@options)->
    super @options
  # -------------------------------------------------- Cache DOM-elements
  _cache: ->
    @$body = $('body')

  # -------------------------------------------------- Bind events
  _bindEvents: ->
    @$node.on 'ajax:before',  (evt, xhr, settings) => @_onBefore(evt, xhr, settings)
    @$node.on 'ajax:beforeSend',  (evt, xhr, settings) => @_onBeforeSend(evt, xhr, settings)
    @$node.on 'ajax:complete', (evt, xhr, status) => @_onComplete(evt, xhr, status)
    @$node.on 'ajax:success', (evt, response, status, xhr) => @_onSuccess(evt, response, status, xhr)
    @$node.on 'ajax:error', (evt, xhr, status, error) => @_onError(evt, xhr, status, error)

  # ------------------------------------------------- Before
  _onBefore: (evt, xhr, settings) ->
    return false if @InProgress

    @_setInProgress true

    @$node.find('input').each((index, item)=>
      @_validateInput $(item)
    )

    if @HasErrors
      @_setInProgress false
      false

  # -------------------------------------------------- Before send request
  _onBeforeSend: (evt, xhr, settings) ->
    @_clearErrors()
    @_setInProgress()

  _onComplete: (evt, xhr, status) ->
    @_setInProgress false


  _onError: (response) ->
    @_setInProgress false
    throw new Error response.message

  # -------------------------------------------------- Success AJAX request
  _onSuccess:  (evt, response, status, xhr) ->
    @_setInProgress false

    if response
      if response.status is API_STATUS_SUCCESS
        @options.onSuccess response
      else if response.status is API_STATUS_FAIL
        @options.onFail response
        @_showErrors response.errors if @options.showErrors
      else
        @_onError response

  # -------------------------------------------------- Hide error
  _hideError: ->


  # -------------------------------------------------- Show form errors by field
  _showErrors: (errors) ->
    for form of errors
      for input of errors[form]
        # Show only first error
        message = errors[form][input]

        $input  = @$node.find("[name='#{form}[#{input}]']")

        unless $input.length
          $input  = @$node.find("[alias='#{input}']")

        $field  = $input.closest('.' + @options.field.wrapper_class)

        $field.addClass @options.field.has_error_class
        $message = $field.find('.' + @options.error.message_class)

        unless $message.length
          $message = $('<span />')
          $message.appendTo $field

          $message.addClass @options.error.message_class


        $message.html message

  # -------------------------------------------------- Clear all form errors
  _clearErrors: ->
    @$node.find('.' + @options.field.has_error_class).removeClass @options.field.has_error_class
    @$node.find('.' + @options.error.message_class).html ''


  # -------------------------------------------------- Manage form state
  _setInProgress:(inProgress = true)->
    @InProgress = inProgress
    if @InProgress
      @$node.find(@options.selectors.submit_btn).addClass('load')
      @$node.find('input, textarea, button').attr('disabled', true)
    else
      @$node.find('.load').removeClass('load')
      @$node.find('input, textarea, button').attr('disabled', false)

  # -------------------------------------------------- Valid input value
  _validateInput: ($input) ->
    @HasErrors = false
    value = @_applyFilters($input)

    if !value.trim() && $input.hasClass('required') && !$input.closest('.hidden').length
      @HasErrors = true
      $input.addClass('active-error')
      $input.focus()

      setTimeout(->
        $input.removeClass('active-error')
      , 150)

      return false
  ###
   Filters
  ###

  # -------------------------------------------------- Apply all filters
  _applyFilters: ($input)->
    value   =  $input.val()
    filters = $input.data('filters')

    if filters
      for filter in filters.split ','
        method = "filter__#{filter.trim()}"
        value = @[method](value)

    value


  # -------------------------------------------------- Only digits
  filter__digits: (value)->
    value.replace(/\D/g,'')

  # -------------------------------------------------- Only digits
  filter__test: (value) ->
    value


AjaxForm.installAsjQueryPlugIn()
