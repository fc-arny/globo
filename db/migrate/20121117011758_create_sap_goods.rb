class CreateSapGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.integer :id
      t.string :name, null: false
      t.text :description
      t.boolean :is_approved, default: false
      t.integer :order_por, default: 0

      t.timestamps
    end
  end
end
