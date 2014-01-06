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
  # Ajax Form
  $('[data-remote=true]').ajaxForm()

  # Flash messsages
  $gmFlashMessage = $('#flash_messages')
  $gmFlashMessage.flashMessage()

  # For update login row after sing in/up
  $gmUserState = $('._user_state_wrapper')
  $gmUserState.userState({type: gmCurUserState})

  # Global popup
  window.$gmPopup = $('.popup-container')
  window.$gmPopup.ajaxPopup()