# SAP application
Sap =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: (data) ->
    console.log 'Init app'

    this.currentStore = ''

    # Data
    this.categories = new Sap.Collections.Categories(data.categories)
    goods = new Sap.Collections.Goods(data.goods)

    # Routers
    new Sap.Routers.Goods(
      goods     : goods
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

@Sap = Sap

# Document load
$(()->
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
        Backbone.history.navigate(page_url, true);
      else
        document.location.href = GOODS_URL + '/' + store
)

