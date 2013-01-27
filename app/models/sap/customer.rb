# -------------------------------------------------------------
# Buyer model referenced to user
# -------------------------------------------------------------
# ==Fields:
#  email, phone   - customer must have email or phone
#  role           - link to user
# -------------------------------------------------------------
class Sap::Customer < SapModel
  # Fields
  attr_accessible :phone, :name, :role

  # Validators
  validates :phone,
            :length => {:is => 11}, # For Russian
            :uniqueness => true,
            :presence => true

  validates :name,
            :length => {:minimum => 1, :maximum => 80}

  # Relationships
  has_one :user, :class_name => 'Sap::User', :as => :role

  before_validation :filter_data

  private

  # -------------------------------------------------------------
  # Prepare data for save
  # -------------------------------------------------------------
  def filter_data
    self.phone.gsub!(/[^0-9]/,'') unless self.phone.nil?
    self.name.strip! unless self.name.nil?
  end


end
