class CreateSapGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.integer :id
      t.string :name
      t.text :description
      t.boolean :is_approved

      t.timestamps
    end
  end
end
