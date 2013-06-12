# == Schema Information
#
# Table name: sap.addresses
#
#  id         :integer          not null, primary key
#  area_id    :integer
#  address    :string(255)
#  name       :string(255)
#  user_id    :integer
#  is_default :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sap::Address < SapModel
  attr_accessible :name, :address, :area_id, :is_default, :user_id
end
