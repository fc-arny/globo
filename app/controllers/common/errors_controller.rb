# -------------------------------------------------------------
# Handle errors
# -------------------------------------------------------------
class Common::ErrorsController < FrontendController
  layout :layout_by_status

  def show
    status = request.path[1..-1]

    @exception = env["action_dispatch.exception"]

    respond_to do |format|
      format.html { render action: status, status: status }
      format.json { render json: {status: status, error: @exception.message} }
    end
  end
  
  private
 
  def layout_by_status
    if params[:status].to_i != 404
      false
    end
  end
end

