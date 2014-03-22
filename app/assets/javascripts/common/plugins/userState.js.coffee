###
  Plugin for updating

  Options:
    type - type of view user state partial
    wrapper - container for user state HTML
###
class window.UserState extends PluginBase

  # Url for getting user state HTML
  URL: '/user/state/show'

  EVT_UPDATE: 'updateUserState'

  @defaultOptions:
    type: 'common'

  # -------------------------------------------------- Constructor
  constructor: (@node, options)->
    super @node, options

    @_bindEvents()

  # -------------------------------------------------- Trigger update event
  update: ->
    $(document).trigger(UserState::EVT_UPDATE);

  # -------------------------------------------------- Binding events
  _bindEvents: ->
    $(document).on UserState::EVT_UPDATE, (event) => @_onUpdate(event)



  ###
  # Events
  ###

  # -------------------------------------------------- Update user state by AJAX
  _onUpdate: (event) ->
    $.ajax(
      url: UserState::URL
      type: 'GET'
      dataType: 'html'
      success: (response) =>
        @$node.html response
    )

UserState.installAsjQueryPlugIn()