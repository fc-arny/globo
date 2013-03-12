# -------------------------------------------------------------
# 
# -------------------------------------------------------------
module Common::MenuHelper
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
    categories = Sap::Category.get_category_tree
    CategoryRenderer.new(categories, self).render
  end

  # -------------------------------------------------------------
  # Main menu categories
  # -------------------------------------------------------------
  class CategoryRenderer

    def initialize(categories,template)
      @template   = template
      @categories = categories

      # Get current store
      @current_store = Sap::Store.find(session[:current_store])
    end

    # -------------------------------------------------------------
    # Render menu
    # -------------------------------------------------------------
    def render
      build_menu
    end

    private

    # -------------------------------------------------------------
    # Generate menu
    # -------------------------------------------------------------
    def build_menu
      haml_tag :div, :class => 'categories-menu' do
        haml_tag :ul, :class => 'categories' do
          @categories.each do |category|
            haml_tag :li, :class => 'item' do
              render_category_item category
            end
          end
        end
      end
    end

    # -------------------------------------------------------------
    # Render category item
    # -------------------------------------------------------------
    def render_category_item(category)
      link = build_link(category[:url])

      haml_tag :a, :href => link, :'data-url' => category[:url]  do
        haml_concat category[:name]
      end

      render_category_subitems(category)
    end

    # -------------------------------------------------------------
    # Render sub categories
    # -------------------------------------------------------------
    def render_category_subitems(category)
      haml_tag :ul, :class => 'sub-categories' do
        category[:children].each do |cat|

          href = build_link(cat[:url])
          data_url = "#{cat[:url]}"

          haml_tag :li, :class => 'sub-item' do
            haml_tag :a, :href => href, :'data-url' => data_url do
              haml_concat cat[:name]
            end
          end
        end
      end
    end

    # -------------------------------------------------------------
    # Create link
    # -------------------------------------------------------------
    def build_link(*urls)
      full_url = "/goods/#{@current_store.url}"
      urls.each do |url|
        full_url += "/#{url}"
      end
      full_url
    end

    # -------------------------------------------------------------
    # If method missing use helpers method of template
    # -------------------------------------------------------------
    def method_missing(*args, &block)
      @template.send(*args, &block)
    end
  end
end