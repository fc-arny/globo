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

# -------------------------------------------------------------
# User feedback from site
# -------------------------------------------------------------
class Feedback < ActiveRecord::Base
  #enum status: {
  #  opened: 1,
  #  answered: 2
  #}
  scope :faq, -> {where('show_in_faq = ?', true).order(position: :asc)}

  has_paper_trail
end
