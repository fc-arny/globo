# ----------------------------------------------------------------------
# User state controller
# ----------------------------------------------------------------------
class User::StateController < FrontendController
  # GET /show
  # Show user state partial 
  def show
    @type = params[:type]
    render layout: false
  end
end
