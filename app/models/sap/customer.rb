# -------------------------------------------------------------
# Buyer model referenced to user
# -------------------------------------------------------------
# ==Fields:
#  email, phone   - customer must have email or phone
#  role           - link to user
# -------------------------------------------------------------
class Sap::Customer < SapModel
  # Fields
  attr_accessible :email, :phone, :name, :role

  # Validators
  validate :login_as_phone_or_email

  validates :email, :uniqueness => true,
                    :length => {:minimum => 3, :maximum => 80}
                    #:format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}

  validates :phone, :uniqueness => true

  # Relationships
  has_one :user, :class_name => 'Sap::User', :as => :role

  # -------------------------------------------------------------
  # For creating customer we need email or phone
  # -------------------------------------------------------------
  def login_as_phone_or_email
    if email.blank? && phone.blank?
      message = 'You must specify email or phone'
      [:email,:phone].each do |field|
        errors.add(field, message)
      end
    end
  end
end
