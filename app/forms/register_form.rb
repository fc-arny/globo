# -------------------------------------------------------------
# Registration form for customer
# -------------------------------------------------------------
# Fields:
# :type     - login type - email or phone
# :login    - just login
# :name     - customer name
# :password - password
# -------------------------------------------------------------
class RegisterForm < ActiveForm

  # Login must be email or phone for customer
  TYPE_LOGIN_EMAIL = 'email'
  TYPE_LOGIN_PHONE = 'phone'

  # Fields
  attr_accessor :type, :login, :name, :password

  # Validators
  validates :type,
            :inclusion => [TYPE_LOGIN_EMAIL,TYPE_LOGIN_PHONE]

  validates :login,
            :length => {:minimum => 4, :maximum => 80}

  validates :name,
            :length => {:minimum => 4, :maximum => 80}

  validates :password,
            :length => {:minimum => 4, :maximum => 80}

  # -------------------------------------------------------------
  # 
  # -------------------------------------------------------------
  def login_unique
     if Sap::User.find_by_login(@login)
       errors.add(field, 'User with this login already exists')
     end
  end

end