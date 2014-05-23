class PagesController < FrontendController
  include HighVoltage::StaticPage
  layout :layout_for_page

  private

  def layout_for_page
    case params[:id]
      when 'about', 'help', 'contacts', 'promo'
        'application'
      else
        'empty'
    end
  end
end