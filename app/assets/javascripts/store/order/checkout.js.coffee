$ ->
  #steps
#  steps = ->
#    el = $(".step")
#    el.hide()
#    el.first().show()
#    btn = $(".js-step-btn")
#    current = $(".position__value-in")
#    btn.click ->
#      el.slideUp()
#      step = $(this).attr("data-step")
#      $("." + step).slideDown()
#      current.removeClass "step-basket"
#      current.removeClass "step-delivery"
#      current.removeClass "step-third"
#      current.addClass step
#
#  steps()
#
#
#  #payment
#  payment = ->
#    el = $(".js-payment")
#    el_btn = el.find("li")
#    item = $(".js-payment-item")
#    item.hide()
#    item.first().show()
#
#    #item.hide();
#    el_btn.click ->
#      unless $(this).hasClass("is-active")
#        el_btn.removeClass "is-active"
#        $(this).addClass "is-active"
#        item.slideUp()
#        val = $(this).attr("data-payment")
#        $("." + val).slideDown()
#
#
#  payment()