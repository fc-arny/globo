# -------------------------------------------------------------
# Handle errors
# -------------------------------------------------------------
class Common::ErrorsController < ApplicationController
  layout false

  def show
    code = request.path[1..-1]
    @exception = env["action_dispatch.exception"]

    respond_to do |format|
      format.html { render action: code }
      format.json { render json: {status: code, error: @exception.message} }
    end
  end
end

