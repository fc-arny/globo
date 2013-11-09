# ----------------------------------------------------------------------
# User state controller
# ----------------------------------------------------------------------
class User::StateController < FrontendController
  # GET /show
  # Show user state partial 
  def show
    path = '/user/state/' + params[:type]
    render partial: path
  end
end
