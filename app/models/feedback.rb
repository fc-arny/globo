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
