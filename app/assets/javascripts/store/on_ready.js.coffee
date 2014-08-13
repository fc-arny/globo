# Document ready code
$ ->
  # Sorting TODO: create directive
  $(document).on('click', '.bc__filter .dropdown-menu a', ->
    text = $(this).text()
    $(this).closest('.bc__filter').find('.dropdown-toggle').html text
  )

  scroll_el = $('.js-scroll')
  scroll_top = 0

  body = $('body')
  page = $('.page')
  wrap = $('.wrap')
  overlay = $('.overlay')

#  $(window).scroll ->
#    scroll_top = $(window).scrollTop()
#    unless body.hasClass("no-scroll")
#      if scroll_top > 90
#        wrap.addClass "is-fixed"
#        cart_el.addClass "is-fixed"
#      else
#        wrap.removeClass "is-fixed"
#        cart_el.removeClass "is-fixed"
#
#  scroll_init = ->
#    scroll_el.jScrollPane hideFocus: true
#
#  # Basket
#  cart_el = $(".cart")
#  cart_popup = $(".cart__popup")
#  cart_close = $(".js-cart-close")
#  cart_popup_open = $(".header .basket")
#  cart_arr = $(".cart__arr")
#
#  cart_popup_open.click ->
#    pos_top = $(this).position().top
#    height = $(this).height()
#    top = pos_top + height / 2 - 14
#    cart_arr.css "top", top
#    unless cart_el.hasClass("is-open")
#      cart_el.addClass "is-open"
#      cart_popup.show()
#      scroll_init()
#      page_top = scroll_top
#      page.css "top", -page_top
#      body.addClass "no-scroll"
#      overlay.show()
#    return
#
#  cart_close.click ->
#    wnd_width = $(window).width()
#    cart_popup.hide()
#    overlay.hide()
#    body.removeClass "no-scroll"
#    cart_el.removeClass "is-open"
#    cart_el.addClass "is-move"
#    return
