# == Schema Information
#
# Table name: feedbacks
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  email       :string(255)      not null
#  message     :text             not null
#  answer      :text
#  user_id     :integer
#  show_in_faq :boolean          default(FALSE)
#  position    :integer          default(0)
#  status      :integer          default(1)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Feedback do
  pending "add some examples to (or delete) #{__FILE__}"
end
