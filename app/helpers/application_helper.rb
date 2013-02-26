module ApplicationHelper

  # -------------------------------------------------------------
  # Display flash messages - :error, :info, :success
  # -------------------------------------------------------------
  def display_flash_message
    type    = nil
    message = nil

    if flash[:error]
      type = 'error'
      message = flash[:error]
    elsif flash[:info]
      type = 'info'
      message = flash[:info]
    elsif flash[:success]
      type = 'success'
      message = flash[:success]
    end

    if !message.nil?
      haml_tag :div, :class => "alert-#{type}" do
        haml_concat message
      end
    end
  end
  # -------------------------------------------------------------
  # Render category tree. We use only two-level categorization
  # -------------------------------------------------------------
  def category_list(section=:main_menu)
    _category_tree = Sap::Category.get_category_tree
    render partial: "partials/base/category_list/#{section}", locals: { :category_tree => _category_tree}
  end

  # -------------------------------------------------------------
  # Render stores
  # -------------------------------------------------------------
  def store_list(section=:main_menu)
    stores = Sap::Store.all.map{|store| [store.name, store.id]}
    render partial: "partials/base/store_list/#{section}", locals: { :stores => stores}
  end

  class << self
    # -------------------------------------------------------------
    # Generate random string
    # -------------------------------------------------------------
    def get_random_string (length = 6)
      str = ''
      length.times do
        is_big = rand(2)
        code = is_big == 1 ? 65 + rand(25) : 97 + rand(25)
        str << code.chr
      end
      return str
    end
  end
end
