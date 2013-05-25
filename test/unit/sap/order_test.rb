# == Schema Information
#
# Table name: sap.orders
#
#  id         :integer          not null, primary key
#  state      :string(255)
#  hash_str   :string(255)
#  sum        :decimal(, )
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class Sap::OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
