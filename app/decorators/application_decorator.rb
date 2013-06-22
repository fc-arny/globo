# -------------------------------------------------------------
# Base class for Decorators
# -------------------------------------------------------------
class ApplicationDecorator < Draper::Decorator

  # -------------------------------------------------------------
  #
  # -------------------------------------------------------------
  def hash_by_attributes(*attributes)
    _hash = {}
    attributes.each do |attribute|
      _hash[attribute] = model[attribute]
    end

    _hash
  end
end