# -------------------------------------------------------------
# =Name: Sap::User
# =Description:
# Base model for users
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   24.11.2012
# -------------------------------------------------------------
# ==Fields:
# login           - login string (email for customer)
# password        - secret key = md5(md5(password) + salt)
# salt            - increase secure for password
# role_id         - role type: Admin, Manager and Customer
# token           - hash for restore token
# valid_token_to  - expire token
# -------------------------------------------------------------
class Sap::User < SapModel
  # Fields
  attr_accessible :id, :login, :password, :salt, :token, :valid_token_to, :name

  # Relationships
  belongs_to :role, :polymorphic => true



  # -------------------------------------------------------------
  # =Name: set_password
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Generate salt and set password
  # -------------------------------------------------------------
  def set_password (password)
    self.salt = ApplicationHelper::get_random_string
    self.password = hash_password(password)
  end

  # -------------------------------------------------------------
  # =Name: auth_by_password
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Auth user by password
  # -------------------------------------------------------------
  def auth_by_password(password)
    hash = hash_password(password)
    result = ( hash == self.password )
  end

  # -------------------------------------------------------------
  # =Name: hash_password
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Get hash-string for password
  # -------------------------------------------------------------
  def hash_password(password)
    Digest::MD5.hexdigest( Digest::MD5.hexdigest(password) + self.salt )
  end

  class << self
    # -------------------------------------------------------------
    # =Name: generate_token
    # =Author: fc_arny
    # -------------------------------------------------------------
    # Generate token
    # -------------------------------------------------------------
    def generate_token(user)
      Digest::SHA1.hexdigest( user.name + user.salt + user.password )
    end
  end
end
