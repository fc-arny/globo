Sap.Collections.Categories = Backbone.Collection.extend(
  model : Sap.Models.Category
  url   : '/api/v1/categories'

  # Get Ccategories by url
  getByUrl: (categoriesUrl)->
    urls = categoriesUrl.split('/')
    categories = this.select((category)->
      url = category.get('url')
      category if url in urls
    )

    console.log categories

    new Sap.Collections.Categories(categories)
)