# -------------------------------------------------------------
# Show some static pages
# -------------------------------------------------------------
class Common::StaticController < FrontendController
  def show
    render action: params[:page]
  rescue ActionView::MissingTemplate
    render_404
  end
  
  private

  def page_exists?
    %w(contacts help about promo).include? params[:page]
  end
end
