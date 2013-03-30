class CreateSapOrders < ActiveRecord::Migration
  def change
    create_table :sap_orders do |t|
      t.integer :id
      t.string :state
      t.decimal :sum
      t.integer :user_id

      t.timestamps
    end
  end
end
