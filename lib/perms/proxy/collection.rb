module Perms
  # -------------------------------------------------------------
  # =Name:
  # =Description:
  # A security-aware proxy for +ActiveRecord+ scopes. This class validates all the
  # method calls and either forwards them to the encapsulated object or raises
  # an exception.
  # -------------------------------------------------------------
  # =Author: fc_arny
  # =Date:  01.14.2013
  # -------------------------------------------------------------
  class Proxy::Collection
    # -------------------------------------------------------------
    # =Name: initialize
    # =Author: fc_arny
    # -------------------------------------------------------------
    # 
    # -------------------------------------------------------------
    def initialize(context, scope, options={})
      @context, @scope, @options = context, scope, options
      @restrictions = @scope.restrictions(context)

      @options[:eager_loaded] ||= {}
    end

    # -------------------------------------------------------------
    # =Name: restrict
    # =Author: fc_arny
    # -------------------------------------------------------------
    #
    # -------------------------------------------------------------
    def restrict(context,options={})
      if @context == context && options.nil?
        self
      end
    end

    # A proxy for +find+ which restricts the returned record or records.
    #
    # @return [Proxy::Record, Array<Proxy::Record>]
    def find(*args)
      result = @scope.find(*args)

      if result.is_a?
        result.map do |row|
          row.restrict(@context, options_with_escape)
        end
      else
        result.restrict(@context, options_with_escape)
      end
    end

    # -------------------------------------------------------------
    # =Name: missing_method
    # =Author: fc_arny
    # -------------------------------------------------------------
    # 
    # -------------------------------------------------------------
    def method_missing(method, *args)
      if method =~ /^find_all_by/
        @scope.send(method, *args).map do |row|
          row.restrict(@context, options_with_eager_load)
        end
      elsif method =~ /^find_by/
        @scope.restrict(@context, options_with_eager_load)
      elsif @scope.perm_scopes && @scope.perm_scopes.include?(method)
        Proxy::Collection.new(@context, @scope.send(method, *args), options_with_escape)
      elsif @scope.respond_to? method
        raise InsecureOperationError,
              "Potentially insecure method #{method} was called"
      else
        super
      end
    end

    # Describes the proxy and proxified scope.
    #
    # @return [String]
    def inspect
      "#<Perms::Proxy::Collection: #{@scope.to_sql}>"
    end

    # A proxy for +includes+ which adds Perms conditions for eager loaded
    # associations.
    def includes(*associations)
      # Normalize association list to strict nested hash.
      normalize = ->(list) {
        if list.is_a? Array
          list.map(&normalize).reduce(:merge)
        elsif list.is_a? Symbol
          { list => {} }
        elsif list.is_a? Hash
          hash = {}
          list.each do |key, value|
            hash[key] = normalize.(value)
          end
          hash
        end
      }
      associations = normalize.(associations)

      current_scope = @scope.includes(associations)

      add_conditions = ->(associations, scope) {
        associations.each do |association, nested|
          reflection = scope.reflect_on_association(association)
          if reflection && !reflection.options[:polymorphic]
            associated_klass = reflection.klass

            if associated_klass.respond_to? :restrict
              nested_scope = associated_klass.restrictions(@context).request_scope(:fetch)

              where_values = nested_scope.where_values
              if where_values.any?
                current_scope = current_scope.where(*where_values)
              end

              add_conditions.(nested, associated_klass)
            end
          end
        end
      }

      unless Perms.skip_eager_condition_injection
        add_conditions.(associations, current_scope)
      end

      options = @options.merge(eager_loaded:
                                   @options[:eager_loaded].merge(associations))

      Proxy::Collection.new(@context, current_scope, options)
    end

    # Return the associated security metadata. The returned hash will contain keys
    # +:context+, +:scope+ and +:options+, corresponding to the parameters in
    # {#initialize}, +:model+ and +:restrictions+, representing the model class.
    #
    # Such a name was deliberately selected for this method in order to reduce namespace
    # pollution.
    #
    # @return [Hash]
    def reflect_on_security
      {
          model:        @scope,
          context:      @context,
          scope:        @scope,
          options:      @options,
          restrictions: @restrictions,
      }.merge(@restrictions.reflection)
    end
    # -------------------------------------------------------------
    # =Name: delegate_as_constructor
    # =Author: fc_arny
    # -------------------------------------------------------------
    # A proxy for +$1+ method, returns a restricted record.
    # -------------------------------------------------------------
    def self.delegate_as_constructor(name,method)
      class_eval(<<-EOM,__FILE__,__LINE__)
      def #{name}(attributes={})
        record = @restrictions.request_scope(:fetch).new.restrict(@context,options_with_escape)
        record
      end
      EOM
    end

    # -------------------------------------------------------------
    # =Name: delegate_as_scope
    # =Author: fc_arny
    # -------------------------------------------------------------
    #
    # -------------------------------------------------------------
    def self.delegate_as_scope(name)
      class_eval(<<-EOM,__FILE__,__LINE__)
      def #{name}(*args)
        Proxy::Collection.new(@context, @scope.#{name}(*args), options_with_escape)
      end
      EOM
    end

    # -------------------------------------------------------------
    # =Name: delegate_as_destroyer
    # =Author: fc_arny
    # -------------------------------------------------------------
    #
    # -------------------------------------------------------------
    def self.delegate_as_destroyer(name)
      class_eval(<<-EOM, __FILE__, __LINE__)
        def #{name}(*args)
          @restrictions.request_scope(:delete,@scope).#{name}(*args)
        end
      EOM
    end

    # -------------------------------------------------------------
    # =Name: delegate_as_record
    # =Author: fc_arny
    # -------------------------------------------------------------
    #
    # -------------------------------------------------------------
    def self.delegate_as_record(name)
      class_eval(<<-EOM, __FILE__, __LINE__ )
        def #{name}(*args)
          @scope.#{name}(*args).restrict(@context,options_with_eager_load)
        end
      EOM
    end

    # -------------------------------------------------------------
    # =Name:
    # =Author: fc_arny
    # -------------------------------------------------------------
    #
    # -------------------------------------------------------------
    def self.delegate_as_value(name)
      class_eval(<<-EOM, __FILE__, __LINE__)
        def #{name}(*args)
          @scope.#{name}(*args)
        end
      EOM
    end


    delegate_as_constructor :build,   :assign_attributes
    delegate_as_constructor :new,     :assign_attributes
    delegate_as_constructor :create,  :update_attributes
    delegate_as_constructor :create!, :update_attributes!

    delegate_as_scope :scoped
    delegate_as_scope :uniq
    delegate_as_scope :where
    delegate_as_scope :joins
    delegate_as_scope :lock
    delegate_as_scope :limit
    delegate_as_scope :offset
    delegate_as_scope :order
    delegate_as_scope :reorder
    delegate_as_scope :reverse_order
    delegate_as_scope :extending

    delegate_as_destroyer :delete
    delegate_as_destroyer :delete_all
    delegate_as_destroyer :destroy
    delegate_as_destroyer :destroy_all

    delegate_as_record  :first
    delegate_as_record  :first!
    delegate_as_record  :last
    delegate_as_record  :last!

    delegate_as_value :calculate
    delegate_as_value :count
    delegate_as_value :average
    delegate_as_value :sum
    delegate_as_value :maximum
    delegate_as_value :minimum
    delegate_as_value :pluck



    # -------------------------------------------------------------
    # =Name: each
    # =Author: fc_arny
    # -------------------------------------------------------------
    #
    # -------------------------------------------------------------
    def each
      @scope.each do |record|
        yield record.restrict(@context, options_with_eager_load)
      end
    end

    private

    # Return options hash to pass to children proxies.
    # Currently this checks only eagerly loaded collections, which
    # shouldn't be passed around blindly.

    def options_with_escape
      @options.reject{ |k,v| k == :eager_loaded}
    end

    def options_with_eager_load
      @options
    end

  end
end