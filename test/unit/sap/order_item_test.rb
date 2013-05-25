# == Schema Information
#
# Table name: sap.order_items
#
#  id           :integer          not null, primary key
#  order_id     :integer
#  good_item_id :integer
#  count        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class Sap::OrderItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
