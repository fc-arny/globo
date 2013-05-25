# == Schema Information
#
# Table name: sap.goods
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :text
#  is_approved :boolean          default(FALSE)
#  order_por   :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class Sap::GoodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
