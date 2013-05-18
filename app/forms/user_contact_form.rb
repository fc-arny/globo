# -------------------------------------------------------------
# Form model for user login
# -------------------------------------------------------------
class UserContactForm < ActiveForm

  # Fields
  attr_accessor :phone, :name

  # Validators
  validates :phone,
            :presence => true

  validates :name,
            :presence => true
end
