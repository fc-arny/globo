# -------------------------------------------------------------
# Like a "BASKET"
# -------------------------------------------------------------
# ==Fields
# :count    - just count
# :good_id  - link to good list item
# :order_id - link to total order
# -------------------------------------------------------------
class Sap::OrderItem < SapModel
  # Fields
  attr_accessible :id, :count, :good_item_id, :order_id

  # Accociations
  belongs_to :order, :class_name => 'Sap::Order'
  belongs_to :good_item, :class_name => 'Sap::GoodItem'

  class << self
    # -------------------------------------------------------------
    # Get order goods by order
    # -------------------------------------------------------------
    def get_by_order_id(id)
      self.where(
          'order_id = :order_id',
          {:order_id => id}
      )
    end
  end

  # -------------------------------------------------------------
  #
  # -------------------------------------------------------------
  #def as_json(options = {})
  #  super(options.merge(
  #            :include => {
  #                :good_item => {
  #                    :only => :name
  #                }
  #            }
  #        )
  #  )
  #end
end
