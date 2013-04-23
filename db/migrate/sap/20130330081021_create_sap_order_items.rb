class CreateSapOrderLists < ActiveRecord::Migration
  def change
    create_table :'sap.order_items' do |t|
      t.integer :id
      t.integer :order_id
      t.integer :good_item_id
      t.integer :count

      t.timestamps
    end
  end
end
