###
  Reset Phone Plugin
###
class ResetPhone extends PluginBase
  @current_step: 'reset'
#  @defaultOptions:


  # -------------------------------------------------- Constructor
  constructor:(@node, options = {}) ->
    super @node, options

    @_cache()
    @_bindEvents()


  # -------------------------------------------------- Bind events
  _bindEvents: ->
    @$node.ajaxForm(
      onSuccess: (response) =>
        @_setStep('check')

    )
    @$phone.mask('+7(999) 999-99-99')
    @$changePhone.on 'click', (event) => @_onChangePhoneClick(event)

  # -------------------------------------------------- Cache DOM
  _cache: ->
    @$phone       = @$node.find('#phone_phone')
    @$action      = @$node.find('#phone_act')
    @$changePhone = @$node.find('.change_phone_link')
    @$submitBtn   = @$node.find('.account__btn button')
    @$password    = @$node.find('.label.password')
    @$code        = @$node.find('.label.code')

  _setStep:(step) ->
    @current_step = step

    if @current_step is 'reset'
      for elem in [@$code, @$password, @$changePhone]
        elem.addClass('hidden')

      @$phone.prop(disabled: false)
      @$action.val('reset')
      @$node.ajaxForm(
        onSuccess: (response) =>
          @_setStep('chack')
      )
    else
      for elem in [@$code, @$password, @$changePhone]
        elem.removeClass('hidden')
        unless elem.closest('label').hasClass('phone')
          elem.prop(value: '')

      @$phone.prop(disabled: true)
      @$action.val('check')
      @$node.ajaxForm(
        onSuccess: (response) ->
          window.$gmPopup.ajaxPopup('hide')
      )

    @$submitBtn.html(@$submitBtn.data @current_step)

  _onChangePhoneClick: (event) ->
    event.preventDefault()
    console.log 'btn'
    @_setStep('reset')


ResetPhone.installAsjQueryPlugIn()