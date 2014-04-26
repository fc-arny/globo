# -------------------------------------------------------------
# Common Helpers
# -------------------------------------------------------------
module ApplicationHelper

  # Title
  def title(page_title)
    content_for :title, page_title.to_s
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

    render partial: 'partials/helpers/flash_message', locals: {message: message, type: type}
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
