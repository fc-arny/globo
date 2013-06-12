
$ ->
  $('#new_login_form').AjaxForm(success:(response)->
    data = response.data

    order = Sap.models.order
    order.set(user_id:data.id)
    order.save()
  )

