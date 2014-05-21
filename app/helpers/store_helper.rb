module StoreHelper
  def goods_search
    render 'partials/helpers/store/goods_search'
  end

  def goods_breadcrumbs(category)
    child  = category ? category : nil
    parent = if child
               category.parent ? category.parent : category
             else
               OpenStruct.new(name: 'Все товары', url: '')
             end

    child = nil if child && child.id == parent.id
    render 'partials/helpers/store/goods_breadcrumbs', parent: parent, child: child
  end
end