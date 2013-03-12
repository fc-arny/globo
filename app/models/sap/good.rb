# -------------------------------------------------------------
# Common good list for all stores
# -------------------------------------------------------------
# ==Fields:
# is_approved - new item entered by a store manager isn't show by default
# status      - state of object (:deleted, :fake and etc)
# -------------------------------------------------------------
class Sap::Good < SapModel

  # Fields
  attr_accessible :description, :id, :is_approved, :name, :status

  # Associations
  has_many :good_list, :class_name => 'Sap::GoodList'
  has_many :category_goods, :class_name => 'Sap::CategoryGood'
  has_many :categories, :class_name => 'Sap::Category', :through => :category_goods

  # -------------------------------------------------------------
  # Get list of goods by store
  # -------------------------------------------------------------
  def get_good_list(store = nil, category = nil)
     self.find_all
  end

  # -------------------------------------------------------------
  #
  # -------------------------------------------------------------
  def as_json(options = { })
    super(options.merge(:only => [:id, :name, :price]))
  end
end
