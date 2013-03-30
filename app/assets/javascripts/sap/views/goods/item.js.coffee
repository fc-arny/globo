Sap.Views.GoodsItem = Support.CompositeView.extend(
  className: 'good-item'
  initialize: (options) ->
    _.bindAll(@,'render')

  # Render good item
  render:()->
    @$el.attr('id', 'good_id_' + @model.id)
    @$el.html(JST['goods/item'](good: @model))
    this
)