Sap.Views.GoodsIndex = Support.CompositeView.extend(
  render: () ->
    console.log 'IndexView'
    this.$el.html(JST['goods/index']())
    this
)