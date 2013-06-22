###
# Plugin for creating order wizard
###
class OrderPlugin extends PluginBase
  @defaultOptions:
    loginForm: '#new_login_form'

  @steps: ['identify', 'delivery', 'payment']




  # When create plugin
  constructor:(@node, options = {}) ->
    super @node, options

    @_initForms()

  # Init and updae plugin options
  initialize: (@options)->
    super @options


  _initForms: ->

    _optionsLogin =
      success:(response)->
        data = response.data

        Sap.models.order.save user_id:data.id, {patch:true}


    console.log @options
    @$node.find(@options.loginForm).AjaxForm(_optionsLogin)


OrderPlugin.installAsjQueryPlugIn()