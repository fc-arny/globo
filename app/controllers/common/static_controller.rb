# -------------------------------------------------------------
# Show some static pages
# -------------------------------------------------------------
class Common::StaticController < FrontendController

  before_action :prepare_team

  def show
    render action: params[:page]
  end

  # POST /feedback
  def feedback
    result = {status: :success}
    feedback_form = FeedbackForm.new feedback_params

    if feedback_form.valid?
      feedback = Feedback.new(feedback_form.to_hash)

      unless feedback.save
        result[:status] = :fail
        result[:errors] = feedback.errors
      end
    else
      result[:status] = :fail
      result[:errors] = feedback_form.errors
    end

    render json: result
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

  private

  # Feedback params
  def feedback_params
    params.require(:feedback).permit(:name, :email, :message)
  end
end
