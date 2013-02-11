class CreateSapUserSettings < ActiveRecord::Migration
  def change
    create_table :'sap.user_settings' do |t|
      t.integer :user_id, :null => false
      t.string :key
      t.string :value
    end
  end
end
