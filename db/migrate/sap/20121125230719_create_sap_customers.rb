class CreateSapCustomers < ActiveRecord::Migration
  def change
    create_table :"sap.customers" do |t|
      t.integer :user_id
      t.string :email
      t.string :name
      t.string :token
      t.boolean :is_proved, default: false, null: false

      t.timestamps
    end
  end
end
