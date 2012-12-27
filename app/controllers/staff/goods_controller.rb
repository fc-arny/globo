# -------------------------------------------------------------
# =Name: Staff::GoodController
# =Description:
# CRUD for goods, good list
# -------------------------------------------------------------
# =Author: fc_arny
# =Date:   07.12.2012
# -------------------------------------------------------------
class Staff::GoodsController < Staff::BaseController
  # -------------------------------------------------------------
  # =Name: index
  # =Author: fc_arny
  # -------------------------------------------------------------
  # List of goods
  # GET /staff/goods
  # -------------------------------------------------------------
  def index
    @list = Sap::Good.all
  end

  # -------------------------------------------------------------
  # =Name: show
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Get good in goods list
  # GET /staff/goods/:id
  # -------------------------------------------------------------
  def show
    @good = Sap::Good.find(params[:id])
  end

  # -------------------------------------------------------------
  # =Name: edit
  # =Author: fc_arny
  # -------------------------------------------------------------
  #
  # -------------------------------------------------------------
  def edit
    @good = Sap::Good.find(params[:id])
    @category = Sap::Category.find_child_in_deep(@good.categories, @good.categories.size)
  end

  # -------------------------------------------------------------
  # =Name: new
  # =Author: fc_arny
  # -------------------------------------------------------------
  # New good form
  # GET /staff/goods/new
  # -------------------------------------------------------------
  def new
    @good = Sap::Good.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @good }
    end
  end

  # -------------------------------------------------------------
  # =Name: create
  # =Author: fc_arny
  # -------------------------------------------------------------
  # Create good
  # -------------------------------------------------------------
  def create
    @good = Sap::Good.new(params[:sap_good])
    respond_to do |format|
      if ! @good.save
        format.html { redirect_to staff_good_path(@good), notice: 'Test was successfully created.' }
        format.json { render json: @good, status: :created, location: @good }
      else
        format.html { render action: "new" }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end
end
