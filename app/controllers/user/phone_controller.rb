# -------------------------------------------------------------
# User's phone
# -------------------------------------------------------------
class User::PhoneController < FrontendController

  # Reset
  def reset
    if request.xhr?
      render partial: 'reset'
    end
  end

end