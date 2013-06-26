###
# Plugin for creating order wizard
###
class OrderPlugin extends PluginBase
  # Orders steps
  STEP_IDENTIFY = 'identify'
  STEP_DELIVERY = 'delivery'
  STEP_PAYMENT  = 'payment'

  @defaultOptions:
    loginForm     : '#new_login_form'
    registerForm  : '#new_customer'
    stepItem      : '.step-item'


  # When create plugin
  constructor:(@node, options = {}) ->
    super @node, options
    @_initForms()
    @step(STEP_IDENTIFY)

  # Init and updae plugin options
  initialize: (@options)->
    super @options


  _initForms: ->
    @$node.find(@options.loginForm).AjaxForm( success: (data) => @_onSuccessLogin(data))
    @$node.find(@options.registerForm).AjaxForm( success: (data) => @_onSuccessRegister(data))

  # -------------------------------------------------- On Success Login
  _onSuccessLogin: (response)->
    data = response.data

    if data.id
      Sap.models.order.save user_id:data.id, {patch:true}
      @step(STEP_DELIVERY)
    else
      throw new Error 'Error while login'

  # -------------------------------------------------- On Success registeration
  _onSuccessRegister: (response)->
    data = response.data

    if data.id
      Sap.models.order.save user_id:data.id, {patch:true}
      @step(STEP_DELIVERY)
    else
      throw new Error 'Error while registeration'

  _onSuccessDevlivery: (response)->
    @step(STEP_PAYMENT)

  step:(stepName)->
    @$node.find(@options.stepItem).hide()
    @$node.find(".step-#{stepName}").show()
    switch stepName
      when STEP_IDENTIFY then 1
      when STEP_DELIVERY then 2
      when STEP_PAYMENT  then 3
      else
        throw new Error "'#{stepName}' step not found"


OrderPlugin.installAsjQueryPlugIn()