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
  attr_accessor :login, :name, :password

  # Validators
  #validates :type,
  #          :inclusion => [TYPE_LOGIN_EMAIL,TYPE_LOGIN_PHONE]

  validates :login,
            :length => {:minimum => 5, :maximum => 30}

  validates :name,
            :length => {:minimum => 4, :maximum => 80}

  validates :password,
            :length => {:minimum => 4, :maximum => 80}

  validate :login_unique

  before_validation :filter_data

  # -------------------------------------------------------------
  # Check Login unique
  # -------------------------------------------------------------
  def login_unique
     if Sap::User.find_by_login(@login)
       errors.add(:login, 'User with this login already exists')
     end
  end

  private

  # -------------------------------------------------------------
  # Filter form data
  # -------------------------------------------------------------
  def filter_data
    self.login.gsub(/[^0-9]/,'')
  end

end