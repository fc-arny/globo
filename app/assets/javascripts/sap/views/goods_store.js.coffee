Sap.Views.GoodsStore = Support.CompositeView.extend(
  initialize: (options) ->
    _.bindAll(this, "render")
    this.model = options.model

  render: () ->
    this.$el.html(JST['goods/store'](store: this.model))
    this
)