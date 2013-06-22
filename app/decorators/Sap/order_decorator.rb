module Sap
  class OrderDecorator < ApplicationDecorator
    decorates Order

    # -------------------------------------------------------------
    #
    # -------------------------------------------------------------
    def index_set(json)
      json.(model, :id, :state)
    end
  end
end
