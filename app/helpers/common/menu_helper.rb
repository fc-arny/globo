module Common::MenuHelper

  # Main menu 
  def menu_with_categories(view = 'header')
    cache_time = Settings.cache.main_menu_sec.to_i
    base_scope = Sap::Category.menu

    cached_categories = Rails.cache.fetch([:header, :categories], expires_in: cache_time.seconds) do
      base_scope.roots
    end

    cached_subcategories = Rails.cache.fetch([:header, :subcategories], expires_in: cache_time.seconds) do
      subcategories = {}
      cached_categories.each do |category|
        index = ['menu-item', category.id].join('-')

        subcategories[index] = category.children.menu
        subcategories[index] << 'image'
      end

      subcategories
    end

    render partial: "partials/#{view}", locals: { categories: cached_categories, subcategories: cached_subcategories }
  end

  # def header_menu_link(*urls)
  #   full_url = '/goods'
  #   urls.each do |url|
  #     full_url += "/#{url}"
  #   end
  #   full_url
  # end

  def menu_group_count(count)
    d2 = (count / 2.0).ceil.to_i
    d3 = (count / 3.0).ceil.to_i

    return d2 + 1  if d2 >= 5 && d2 <= 8
    return d3 > 6 ? d3 + 1 : count - 1
  end

  # -------------------------------------------------------------
  # Render stores
  # -------------------------------------------------------------
  def store_list
    stores = []
    stores.push ['Choose store', nil]
    Sap::Store.all.each do |store|
      stores.push [store.name, store.url]
    end

    selected  = get_session_setting(:store_id)
    options   = options_for_select(stores, selected )

    haml_tag :div, class: 'select-store' do
      haml_concat select_tag('select-store', options)
    end
      #.b-store-choose
      #.b-select.g-clearfix
      # = select_tag(:store_select,options_for_select(stores, session_setting(:store_id) ))
  end
  # -------------------------------------------------------------
  # Render category tree. We use only two-level categorization
  # -------------------------------------------------------------
  def category_list
    #categories = Sap::Category.all #get_category_tree
    #CategoryRenderer.new(categories, self).render
  end
end