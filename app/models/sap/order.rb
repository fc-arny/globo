# -------------------------------------------------------------
# Total order
# == Fields:
# :id       - order ID
# :hash_str - for identification
# :state    - new, paid etx state of order
# :sum      - total order sum
# :user_id  - user ID
# -------------------------------------------------------------
class Sap::Order < SapModel
  # Constants
  STATE_NEW = 'new'

  # Fields
  attr_accessible :id, :state, :sum, :user_id, :hash_str

  # Reletionships
  has_many :order_items, :class_name => 'Sap::OrderItem'


  class << self
    # -------------------------------------------------------------
    # Fetch order by id and hash
    # Hash has the format: ID + 'x' + HASH_STR
    # -------------------------------------------------------------
    def get_by_hash(hash)
      id, hash_str = hash.split(/x/,2)
      self.where(
          'id = :id AND hash_str = :hash_str',
          {:id => id, :hash_str => hash_str}
      ).first!
    end
  end

  def as_json(options={})

    # Good's settings
    good_setting = [
        :good => {:only => [:id, :name]}
    ]

    # GoodItem's settings
    good_item_setting = [
        :good_item => {
            :only => [:id,:price,:store_id],
            :include => good_setting
        }
    ]

    # OrderItem's settings
    order_item_setting = [
        :order_items => {
            :only => [:id, :count],
            :include => good_item_setting
        }
    ]

    order = super(options.merge( :include => order_item_setting ))
  end
end
