# SAP application
Sap =
  # Namespaces
  Views       : {}
  Models      : {}
  Routers     : {}
  Collections : {}

  # Events' name
  E_ORDER_ADD_TO_BASKET : 'order.addToBasket'
  E_ORDER_UPDATE_COUNT  : 'order.updateCount'

  # API statuses
  API_STATUS_ERROR    : 'error'
  API_STATUS_SUCCESS  : 'success'

  # Instances
  views       : {}
  models      : {}
  routers     : {}
  collections : {}

  # -------------------------------------------------- Init application
  initialize: (data) ->
    @currentStore = ''

    # Event aggragation
    @vent = _.extend({}, Backbone.Events)

    # Setup read-only collections
    @collections.stores     = new Sap.Collections.Stores data.stores
    @collections.categories = new Sap.Collections.Categories data.categories

    # Setup order
    @models.order = new Sap.Models.Order data.order if data.order

    # Render basket if order exist
#    if @models.order
#      @views.basket = new Sap.Views.Basket collection: @models.order.items
#      @views.basket.render()

    @

  # -------------------------------------------------- Init route
  initRoute: ->
    # Setup routers
    @routers.goods = new Sap.Routers.Goods

    # Enable histroy API
    unless Backbone.history.started
      Backbone.history.start(
        pushState: true
        root: '/goods'
      )
      Backbone.history.started = true
  # -------------------------------------------------- Error handler
  errorHandler: ->



window.Sap = Sap


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


        Backbone.history.navigate(page_url, true)
      else
        document.location.href = GOODS_URL + '/' + store
)

