# -------------------------------------------------------------
# Form for feedback
# -------------------------------------------------------------
class FeedbackForm < ActiveForm
  attr_accessor :name, :email, :message

  validates :name, presence: true, length: {minimum: 2, maximin: 80}
  validates :email, presence: true, length: {minimum: 8, maximin: 80}
  validates :message, presence: true, length: {minimum: 10, maximin: 5000}

  before_validation do
    @name.strip!
    @email.strip!
    @message.strip!
  end
end