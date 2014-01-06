GM.Collections.Stores = Backbone.Collection.extend(
  model : GM.Models.Store
  url   : '/api/v1/stores'

  # Get store by url
  getByUrl: (url)->
    stores = this.select((store)->
      store if store.get('url') == url
    )

    stores[0]
)