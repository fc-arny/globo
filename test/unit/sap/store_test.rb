# == Schema Information
#
# Table name: sap.stores
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  order_pos  :integer          default(0)
#  url        :string(255)      not null
#  region_id  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class Sap::StoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
