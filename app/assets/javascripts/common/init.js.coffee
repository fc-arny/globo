###
# For all pages init
###

# Global variable for all pages
# jQuery objects
window.$gmPopup        = null
window.$gmUserState    = null
window.$gmFlashMessage = null

window.gmCurUserState  = 'common'

# Document ready
$ ->
  # Flash messsages
  $gmFlashMessage = $('#flash_messages')
  $gmFlashMessage.flashMessage()

  # For update login row after sing in/up
  $gmUserState = $('._user_state_wrapper')
  $gmUserState.userState({type: gmCurUserState})

  $btnLogin = $('._user_state_wrapper')

  $btnLogin.on 'click', '.user-state__settings', (event) ->
    event.stopPropagation()
    $(this).next().show()

  btnLoginTimeout = null
  $btnLogin.on
    mouseenter: ->
      clearTimeout(btnLoginTimeout)
    mouseleave: ->
      btnLoginTimeout = setTimeout(->
        $btnLogin.next().hide()
      , 2000)
  , '.user-state__settings'

  # Global popup
  window.$gmPopup = $('.popup-container')
  window.$gmPopup.ajaxPopup()