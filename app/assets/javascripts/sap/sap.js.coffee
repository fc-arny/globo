# SAP application
Sap =
  # Namespaces
  Views       : {}
  Models      : {}
  Routers     : {}
  Collections : {}

  # Instances
  views       : {}
  models      : {}
  routers     : {}
  collections : {}

  # Init application
  initialize: (data) ->

    @routers.goods = new Sap.Routers.Goods

    this.currentStore = ''

    # Set collections
    @collections.stores     = new Sap.Collections.Stores(data.stores)
    @collections.categories = new Sap.Collections.Categories(data.categories)

    # Set routers
    @routers.goods = new Sap.Routers.Goods(
      categories: this.categories
    )

    # Enable histroy API
    if (!Backbone.history.started)
      Backbone.history.start(
        pushState: true
        root: '/goods'
      )
      Backbone.history.started = true

    this

  createjQueryPlugin : (Class) ->
    className = Class.toString().match(/^function ([^(]+)/)[1]
    pluginName = className.slice(0, 1).toLowerCase() + className.slice(1)
    $.fn[pluginName] = (options) ->
      args = undefined
      args = Array::slice.call(arguments, 1)
      @each ->
        obj = undefined
        obj = $(this).data(pluginName)
        unless obj instanceof Class
          obj = new Class($(this), options)
          $(this).data pluginName, obj
        obj[options].apply obj, args  if typeof options is "string"

@Sap = Sap



# Document load
$(()->
  $('li.item').mainMenu()

  GOODS_URL = '/goods'
  $('#select-store').on 'change', ()->
    store       = $(@).val()
    currentUrl  = location.pathname

    if store
      # Url start with /goods
      if currentUrl.indexOf(GOODS_URL) == 0
        parts = currentUrl.split('/')

        # Replace store url-part
        parts[2] = store
        page_url = parts.join('/').replace(GOODS_URL,'')

        # Change link for categories
        $('#main-menu a').each((index,link)->
          category_url = GOODS_URL + '/' + store + '/' + $(link).data('url')
          $(link).attr('href', category_url)
        )
        $.ajax
          url: GOODS_URL + '/' + store
          dataType: 'json'


        Backbone.history.navigate(page_url, true);
      else
        document.location.href = GOODS_URL + '/' + store
)

