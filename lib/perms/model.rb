module Perms
  # Perms is attached to your models by including the module and defining the
  # restrictions in your classes.
  #
  #     class Article < ActiveRecord::Base
  #       include Perms::Model
  #
  #       restrict do |context|
  #         # ...
  #       end
  #     end
  #
  # {Perms::Model} should be included prior to any other modules, as it may omit
  # some named scopes defined by those if it is not.
  module Model
    extend ActiveSupport::Concern

    included do
      class_attribute :perm_restrictions, :instance_writer => false
    end

    # Class methods for {Perms::Model}.
    module ClassMethods
      # -------------------------------------------------------------
      # @overload restrict
      #   Define restrictions for a model with a DSL.
      #
      #   @yield A passed block is executed in the context of a new {Evaluator}.
      #
      # @overload restrict(context, action =:view)
      #   Return a secure collection object for the current scope.

      #   @param [Object] context security context
      #   @param [Symbol] options  kind of actions which will be performed
      #   @return [Proxy::Collection]
      # -------------------------------------------------------------
      def restrict(context=nil,options={},&block)
        if block
          self.perm_restrictions = Evaluator.new(self, block)
        else
          Proxy::Collection.new(context, restrictions(context).request_scope(:fetch, self), options)
        end
      end

      # An internal attribute to store the list of user-defined name scopes.
      attr_accessor :perm_scopes

      # An interceptor for named scopes which adds them to {#perm_scopes} list.
      def scope(name, *args)
        self.perm_scopes ||= []
        self.perm_scopes.push name
      end

      # @api private
      #
      # An internal attribute to store the list of user-defined relation-like methods
      # which return ActiveRecord family objects and can be automatically restricted.
      attr_accessor :perm_relations

      # A DSL method for defining relation-like methods.
      def perm_relation(*methods)
        self.perm_relations ||= []
        self.perms_relations  += methods.map(&:to_sym)
      end

      # -------------------------------------------------------------
      # Evaluate the restrictions for a given +context+ and +record+.
      #
      # @return [Evaluator]
      # -------------------------------------------------------------
      def restrictions(context, record=nil)
        perm_restrictions.evaluate(context,record)
        #puts perm_res
      end
      # -------------------------------------------------------------
      #
      # -------------------------------------------------------------
      def perm_proxy_class
        unless  @perm_proxy_class
          record = self

          @perm_proxy_class = Class.new(Proxy::Record) do
            define_singleton_method :model_name do
              record.model_name
            end
          end

        end
        @perm_proxy_class
      end
    end



    # Return a secure proxy object for the record
    #
    # @return [Proxy::Record]
    def restrict(context, options={})
      self.class.perm_proxy_class.new(context, self, options)
    end

  end
end