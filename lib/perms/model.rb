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
      # =Name: restrict
      # =Author: fc_arny
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
          raise "TODO:Restrict no block"
        end
      end
    end

  end
end