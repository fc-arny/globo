module Common::MenuHelper

  # Main menu 
  def header_menu
    cache_time = Settings.cache.main_menu_sec.to_i

    categories = Rails.cache.fetch([:header, :categories], expires_in: cache_time.seconds) do
      Sap::Category.where('parent_id IS NULL').to_a
    end

    subcategories = Rails.cache.fetch([:header, :subcategories], expires_in: cache_time.seconds) do
      _subcategories = {}
      categories.each do |parent|
        _subcategories["menu-item-#{parent.id}"] = Sap::Category.where(parent_id: parent.id).to_a
      end

      _subcategories
    end

    render partial: 'partials/header', locals: { categories: categories, subcategories: subcategories }
  end

  def header_menu_link(*urls)
    full_url = '/goods/store'
    urls.each do |url|
      full_url += "/#{url}"
    end
    full_url
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

    haml_tag :div, :class => 'select-store' do
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