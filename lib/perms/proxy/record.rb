module Perms
  class Proxy::Record
    # -------------------------------------------------------------
    # =Name: initialize
    # =Author: fc_arny
    # -------------------------------------------------------------
    # Create a record proxy.
    # -------------------------------------------------------------
    def initialize(context,record,options = {})
      @context,@record,@options = context, record. options.dup
      @restrictions = @record.class.restrictions(context, record)
    end

    # -------------------------------------------------------------
    # =Name: insecure
    # =Author: fc_arny
    # -------------------------------------------------------------
    # Return record
    # -------------------------------------------------------------
    def insecure
      @record
    end
  end
end