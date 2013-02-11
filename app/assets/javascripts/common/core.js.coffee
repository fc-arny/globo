# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(()->

  $('.b-select').on 'click', ()->
    $(@).toggleClass 'active'

  $('#store-select').on 'change', ()->
    window.store = $(@).val()
    $.ajax
      url: '/common/settings/setup'
      dataType: 'json'
      data:
        key   : 'store_id'
        value : $(@).val()
      success: ->
        location.reload(true)


  $('.admin-resize-list a').on 'click', ()->
    widthType = $(@).attr('class').split('-')
    $('.l-wrapper')
      .removeClass('width-monitor width-tablet width-mobile')
      .addClass 'width-' + widthType[1]
    false
#  classes = element.attr('class').split(/\s+/);
#
#  pattern = /^icon-/
#
#  for(var i = 0; i < classes.length; i++){
#  className = classes[i];
#
#  if className.match pattern
#    element.removeClass className

)
