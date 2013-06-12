class CreateSapAddresses < ActiveRecord::Migration
  def change
    create_table :'sap.addresses' do |t|
      t.integer :area_id, comment: 'Link to city or other area'
      t.string :address, comment: 'Street, house number, flat and etc'
      t.string :name, comment: 'Address name, for example, "Home", "Office" and etc'
      t.integer :user_id, comment: 'Link to user'
      t.boolean :is_default, comment: 'Is this address default for user?'

      t.timestamps
    end
  end
end
