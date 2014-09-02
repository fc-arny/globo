# -------------------------------------------------------------
# Common Helpers
# -------------------------------------------------------------
module ApplicationHelper

  # Title
  def title(page_title)
    content_for :title, page_title.to_s
  end

  def title_tail
    [Settings.common.title, Settings.common.page_title].join(' - ')
  end

  # -------------------------------------------------------------
  # Display flash messages - :error, :info, :success
  # :info - default message type
  # -------------------------------------------------------------
  def display_flash_message
    type    = nil
    message = nil

    if flash[:error]
      type    = 'error'
      message = flash[:error]
    elsif flash[:success]
      type    = 'success'
      message = flash[:success]
    elsif flash[:info]
      type    = 'info'
      message = flash[:info]
    end

    render 'partials/helpers/flash_message', message: message, type: type
  end

  # Check controller name
  def controller?(*controller)
    controller.include?(params[:controller])
  end

  # Check action name
  def action?(*action)
    action.include?(params[:action])
  end

end
