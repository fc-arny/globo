# -------------------------------------------------------------
# Common Helpers
# -------------------------------------------------------------
module ApplicationHelper

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

    if message
      haml_tag :div, :class => "alert-#{type}" do
        haml_concat message
      end
    end
  end

end
