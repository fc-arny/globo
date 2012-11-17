class CreateSapStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :id
      t.string :name
      t.integer :order_pos

      t.timestamps
    end
  end
end
