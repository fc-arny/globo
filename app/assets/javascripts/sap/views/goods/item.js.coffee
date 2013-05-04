###
# Good Item View
###
class Sap.Views.GoodsItem extends Support.CompositeView
  className: 'good-item'
  initialize: (options) ->
    _.bindAll(@,'render')

  # Render good item
  render:()->
    @$el.attr('id', 'gi_id_' + @model.get('item_id'))
    @$el.html(JST['goods/item'](good: @model))
    this