$ ->

  $(document).on('click', '.bc__filter .dropdown-menu a', ->
    text = $(this).text()
    $(this).closest('.bc__filter').find('.dropdown-toggle').html text
  )