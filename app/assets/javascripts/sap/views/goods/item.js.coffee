###
# Good Item View
###
class Sap.Views.GoodsItem extends Support.CompositeView
  className: 'good-item'

  # -------------------------------------------------- Constructor
  initialize: (options) ->


  # -------------------------------------------------- Render good item
  render:()->
    @$el.attr('id', 'good_item_' + @model.get('item_id'))
    @$el.data('good_item_id', @model.get 'id' )
    @$el.html(JST['goods/item'](good: @model))
    @$el.find('.actions').html JST['goods/actions'](good: @model)
    this