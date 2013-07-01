# -------------------------------------------------------------
# Create table for store
# -------------------------------------------------------------
class CreateSapStores < ActiveRecord::Migration
  def change
    create_table :sap_stores, :comment => 'List of stores' do |t|
      t.string  :name, null: false
      t.integer :order_pos, default: 0
      t.string  :url, null: false
      t.string  :region_id
      t.time    :work_time_from
      t.time    :work_time_to
      t.timestamps
    end
  end
end


