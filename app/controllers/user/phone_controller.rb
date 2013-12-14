# -------------------------------------------------------------
# User's phone
# -------------------------------------------------------------
class User::PhoneController < FrontendController

  # Reset
  def reset
    @phone_form  = Sap::ResetPhoneForm.new(phone: current_user.reset_phone_new)
    if request.xhr?
      render partial: 'reset'
    end
  end

end