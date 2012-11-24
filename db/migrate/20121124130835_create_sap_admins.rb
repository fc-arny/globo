class CreateSapAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.integer :user_id, null:false
      t.integer :city_id
      t.string :name, null:false
      t.string :position

      t.timestamps
    end
  end
end
