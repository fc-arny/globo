# -------------------------------------------------------------
# Show some static pages
# -------------------------------------------------------------
class Common::StaticController < FrontendController

  before_action :prepare_team

  def show
    render action: params[:page]
  rescue ActionView::MissingTemplate
    render_404
  end

  # POST /feedback
  def feedback
    sleep(20)
  end
  
  private

  def page_exists?
    %w(contacts help about promo).include? params[:page]
  end

  # Set team 
  def prepare_team
    @team = {
      arthur: {
        name: 'Артур Щеглов',
        title: 'Основатель, СЕО и разработчик по совместительству'
      },
      sasha: {
        name: 'Саша Трифан',
        title: 'Дизайнер, творец и муж'
      },
      moroz: {
        name: 'Артур Мороз',
        title: 'Мастер фронтенда'
      },
      dima: {
        name: 'Дима Хрешко',
        title: 'Дизайнер UI'
      },
      alexey: {
        name: 'Алексей Коробицын',
        title: 'Java разработчик, архитектор'
      },

    }
  end
end
