# Support for HTTP PATCH.
# Should not be necessary as of Rails 4.

# See: actionpack/lib/action_dispatch/routing/mapper.rb
module ActionDispatch
  module Routing
    class Mapper
      module HttpHelpers

        # Define a route that only recognizes HTTP PATCH.
        # For supported arguments, see <tt>Base#match</tt>.
        #
        # Example:
        #
        # patch 'bacon', :to => 'food#bacon'
        def patch(*args, &block)
          map_method(:patch, *args, &block)
        end

      end
    end
  end
end

# See: actionpack/lib/action_dispatch/testing/integration.rb
module ActionDispatch
  module Integration
    module RequestHelpers

      # Performs a PATCH request with the given parameters. See +#get+ for more
      # details.
      def patch(path, parameters = nil, headers = nil)
        process :patch, path, parameters, headers
      end

    end
  end
end