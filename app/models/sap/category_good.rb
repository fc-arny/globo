# -------------------------------------------------------------
# =Name: Sap::CategoryGood
# =Description:
# Many-to-many relationship Sap::Goods and Sap::Categories
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   15.12.2012
# -------------------------------------------------------------
# ==Fields:
# category_id - category ID
# good_id     - good ID
# -------------------------------------------------------------

class Sap::CategoryGood < SapModel
  # Table name
  set_table_name :"sap.category_good"

  # Fields
  attr_accessible :category_id, :good_id

  # Associations
  belongs_to :good, :class_name => 'Sap::Good', :foreign_key => "good_id"
  belongs_to :category, :class_name => 'Sap::Category', :foreign_key => "category_id"

end
