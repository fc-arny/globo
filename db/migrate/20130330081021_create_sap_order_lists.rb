class CreateSapOrderLists < ActiveRecord::Migration
  def change
    create_table :sap_order_lists do |t|
      t.integer :id
      t.integer :order_id
      t.integer :good_id
      t.integer :count

      t.timestamps
    end
  end
end
