# -------------------------------------------------------------
# Create table for store
# -------------------------------------------------------------
class CreateSapStores < ActiveRecord::Migration
  def change
    create_table :"sap.stores" do |t|
      t.integer :id
      t.string  :name, null: false
      t.integer :order_pos, default: 0
      t.string  :url, null: false
      t.string  :region_id
      t.timestamps
    end
  end
end


