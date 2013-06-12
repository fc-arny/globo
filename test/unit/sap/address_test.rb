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

require 'test_helper'

class Sap::AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
