# -------------------------------------------------------------
# Common Helpers
# -------------------------------------------------------------
module ApplicationHelper

  # -------------------------------------------------------------
  # Display flash messages - :error, :info, :success
  # :info - default message type
  # -------------------------------------------------------------
  def display_flash_message
    type    = nil
    message = nil

    if flash[:error]
      type    = 'error'
      message = flash[:error]
    elsif flash[:success]
      type    = 'success'
      message = flash[:success]
    elsif flash[:info]
      type    = 'info'
      message = flash[:info]
    end

    if message
      haml_tag :div, :class => "alert-#{type}" do
        haml_concat message
      end
    end
  end

  # -------------------------------------------------------------
  # Get hash-string for password   md5(md5(password) + salt)
  # -------------------------------------------------------------
  def hash_password(password, salt)
    Digest::MD5.hexdigest( Digest::MD5.hexdigest(password) + salt )
  end


  # -------------------------------------------------------------
  # Generate random string
  # -------------------------------------------------------------
  def get_random_string (length = 6)
    str = ''
    length.times do
      type = rand(3)
      code =  case type
               when 1 then 65 + rand(25)  # Big letter
               when 2 then 97 + rand(25)  # Small letter
               else 48 + rand(9)          # Number
      end

      str << code.chr
    end
    return str
  end

end
