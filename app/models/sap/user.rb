# -------------------------------------------------------------
# Base model for users
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

  include Perms::Model

  # Fields
  attr_accessible :id, :login, :password, :salt, :token, :valid_token_to, :name

  # Relationships
  belongs_to :role, :polymorphic => true

  # Restrict
  restrict do |user, record|
    scope :fetch, -> { where('id IN (30,31)') }
    scope :delete, -> { where('id IN (30,31)') }
    can [:view, :create, :update]
  end

  # -------------------------------------------------------------
  # Generate salt and set password
  # -------------------------------------------------------------
  def set_password (password)
    self.salt = ApplicationHelper::get_random_string
    self.password = hash_password(password)
  end

  # -------------------------------------------------------------
  # Auth user by password
  # -------------------------------------------------------------
  def auth_by_password(password)
    hash = hash_password(password)
    result = ( hash == self.password )
  end

  # -------------------------------------------------------------
  # Get hash-string for password
  # -------------------------------------------------------------
  def hash_password(password)
    Digest::MD5.hexdigest( Digest::MD5.hexdigest(password) + self.salt )
  end

  class << self
    # -------------------------------------------------------------
    # Generate token
    # -------------------------------------------------------------
    def generate_token(user)
      Digest::SHA1.hexdigest( user.name + user.salt + user.password )
    end

    # -------------------------------------------------------------
    # Find user by valid token
    # -------------------------------------------------------------
    def get_user_by_valid_token(token)
      self.where('token = ? AND (valid_token_to < ? OR valid_token_to IS NULL)', token).first
    end
  end
end
