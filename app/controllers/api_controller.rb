# -------------------------------------------------------------
# Controller for api request
# -------------------------------------------------------------
class ApiController < ApplicationController

  # Don't render layout
  layout false

  # Only JSON response
  respond_to :json
end