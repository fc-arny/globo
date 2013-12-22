# -------------------------------------------------------------
# Show base or static pages
# -------------------------------------------------------------
class Common::IndexController < FrontendController
  layout :set_layout

  # Show main page
  def main
    @stores = Sap::Store.active
  end

  # When javascript or/and cookie disabled
  def badbrowser
  end

  # About project page
  def about
  end

  # Contacts
  def contacts
  end

  # Help page
  def help
  end

  private
    # Set layout by action
    def set_layout
      case action_name
        when 'badbrowser'
          'badbrowser'
        when 'main'
          'base'
        else
          'application_without_basket'
      end
    end
end

