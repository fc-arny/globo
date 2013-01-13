module Perms
  # Evaluator is a DSL for managing permissions on records with the field granularity.
  #
  # The field +#id+ is whitelisted by default.
  #
  # The DSL consists of three functions: {#scope}, {#can} and {#cannot}.
  class Evaluator
    attr_reader :allowed_fields #, :fixtures, :validators
    # -------------------------------------------------------------
    # =Name: 
    # =Author: fc_arny
    # -------------------------------------------------------------
    # 
    # -------------------------------------------------------------
    def initialize(model_class, block)
      @model_class, @block = model_class, block

      @scopes = {}
      @allowed_fields = {}
    end

    # -------------------------------------------------------------
    # =Name: scope
    # =Author: fc_arny
    # -------------------------------------------------------------
    # Define a scope. A special +:fetch+ scope is applied to any other scope
    # automatically.
    # -------------------------------------------------------------
    def scope(name, explicit_block=nil, &implicit_block)
     unless [:fetch, :delete].include?(name)
       raise "There is no such scope as #{name}"
     end
      @scopes[name] = explicit_block || implicit_block || -> {scoped}
    end

    # -------------------------------------------------------------
    # =Name: can
    # =Author: fc_arny
    # -------------------------------------------------------------
    # Define allowed operations for action(s).

    # @param [Symbol, Array<Symbol>] actions one or more action names
    # @param [Hash<Hash, Object>] fields field restrictions
    # -------------------------------------------------------------
    def can(actions, fields=@model_class.to_adapter.column_names)
      Array(actions).map(&:to_sym).each do |action|
        @allowed_fields[action] += Array(fields)
      end
    end
  end
end