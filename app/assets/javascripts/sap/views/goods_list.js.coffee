Sap.Views.GoodsList = Support.CompositeView.extend(
#    intialize: (options) ->
#      console.log options
#      _.bindAll(this, "render")

  render: () ->
    console.log 'ListView'
    this.$el.html(JST['goods/list'](goods: this.collection))
    this
)