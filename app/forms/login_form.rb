# -------------------------------------------------------------
# Form model for user login
# -------------------------------------------------------------
class LoginForm < ActiveForm

  # Fields
  attr_accessor :login, :password

  # Validators
  validates :login,
            :presence => true

  validates :password,
            :presence => true
end
