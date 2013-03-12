Sap.Views.GoodsList = Support.CompositeView.extend(
  initialize: (options) ->
    _.bindAll(this, "render")
    this.collection = options.collection

  render: () ->
    this.$el.html(JST['goods/list'](goods: this.collection))
    this
)