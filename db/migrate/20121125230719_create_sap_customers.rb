class CreateSapCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :user_id
      t.string :email
      t.string :last_name
      t.string :first_name

      t.timestamps
    end
  end
end
