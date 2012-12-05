class SapModel < ActiveRecord::Base
  self.abstract_class = true
  def self.table_name_prefix
    'sap.'
  end
end

