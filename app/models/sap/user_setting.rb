# -------------------------------------------------------------
# Model for saving pair kay:value
# -------------------------------------------------------------
class Sap::UserSetting < SapModel
  attr_accessible :key, :user_id, :value

  class << self
    def set_value(user_id, key, value)
      if !user_id.nil?
        setting = self.new do |s|
          s.key = key
          s.value = value
          s.user_id = user_id
        end
        setting.save
      end
    end
  end
end
