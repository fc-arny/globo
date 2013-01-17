module ApplicationHelper
  # -------------------------------------------------------------
  # Render category tree. We use only two-level categorization
  # -------------------------------------------------------------
  def category_main_menu
    # TODO: Move here render menu
  end
  class << self
    # -------------------------------------------------------------
    # Generate random string
    # -------------------------------------------------------------
    def get_random_string (length = 6)
      str = ''
      length.times do
        is_big = rand(2)
        code = is_big == 1 ? 65 + rand(25) : 97 + rand(25)
        str << code.chr
      end
      return str
    end
  end
end
