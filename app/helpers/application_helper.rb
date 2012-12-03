module ApplicationHelper
  # -------------------------------------------------------------
  # =Name: category_tree
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Render category tree. We use only two-level categorization
  # -------------------------------------------------------------
  def category_main_menu
    # TODO: Move here render menu
  end
  class << self
    # -------------------------------------------------------------
    # =Name: get_random_string
    # =Author: fc_arny
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
