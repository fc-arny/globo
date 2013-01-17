# -------------------------------------------------------------
# Store's Manager
# -------------------------------------------------------------
# ==Fields:
# store_id - reference to store
# user_id  - reference to base user model
# -------------------------------------------------------------
class Sap::Manager < SapModel
  # Fields
	attr_accessible :first_name, :last_name, :store_id, :user_id

  # Relationships
  has_one :user, :class_name => 'Sap::User', :as => :role
end
