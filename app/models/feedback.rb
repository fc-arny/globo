# -------------------------------------------------------------
# User feedback from site
# -------------------------------------------------------------
class Feedback < ActiveRecord::Base
  enum status: {
    opened: 1,
    answered: 2
  }
end
