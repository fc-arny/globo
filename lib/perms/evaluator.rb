module Perms
  # Evaluator is a DSL for managing permissions on records with the field granularity.
  #
  # The field +#id+ is whitelisted by default.
  #
  # The DSL consists of three functions: {#scope}, {#can} and {#cannot}.
  class Evaluator
    attr_reader :allowed_fields #, :fixtures, :validators

    # -------------------------------------------------------------
    # 
    # -------------------------------------------------------------
    def initialize(model_class, block)
      @model_class, @block = model_class, block

      @scopes = {}
      @allowed_fields = {}
    end

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
    # Define allowed operations for action(s).

    # @param [Symbol, Array<Symbol>] actions one or more action names
    # @param [Hash<Hash, Object>] fields field restrictions
    # -------------------------------------------------------------
    def can(actions, fields=@model_class.column_names)
      Array(actions).map(&:to_sym).each do |action|
        @allowed_fields[action] += Array(fields)
      end
    end

    # -------------------------------------------------------------
    #
    # -------------------------------------------------------------
    def can?(action)
      @allowed_fields.include? action
    end

    # -------------------------------------------------------------
    # Compute the restrictions for a given +context+ and possibly a specific +record+.
    # Invokes a +block+ passed to the +initialize+ once.
    # -------------------------------------------------------------
    def evaluate(context, record =  nil)
      if [context,record] != @last_context
        @scopes = {}
        @allowed_fields = Hash.new { [] }

        @allowed_fields[:view] += [ :id ]

        instance_exec context, record, &@block

        unless @scopes[:fetch]
          raise RuntimeError, 'A :fetch scope must be defined'
        end

        @allowed_fields.each do |action, fields|
          fields.uniq!
        end

        [@scopes, @allowed_fields].map(&:freeze)
      end

      self
    end

    # -------------------------------------------------------------
    # Request a scope.
    #
    # @param name name of the scope
    # @param basic_scope the scope to which scope +name+ will be applied. Defaults to +:fetch+.
    #
    # @return +ActiveRecord+ scope.
    #
    # @raise [RuntimeError] if the scope is not defined
    # -------------------------------------------------------------
    def request_scope(name=:fetch, basic_scope=nil)
      unless @scopes.has_key? name
        raise RuntimeError, "The #{name.inspect} scope does not exist"
      end

      if name == :fetch && basic_scope.nil?
        @model_class.instance_exec(&@scopes[:fetch])
      else
        (basic_scope || request_scope(:fetch)).instance_exec(&@scopes[name])
      end
    end
  end
end