GM.Collections.Categories = Backbone.Collection.extend(
  model : GM.Models.Category
  url   : '/api/v1/categories'

  # Get categories by url
  getByUrl: (categoriesUrl)->
    urls = categoriesUrl.split('/')
    categories = this.select((category)->
      url = category.get('url')
      category if url in urls
    )

    categories[0]
)