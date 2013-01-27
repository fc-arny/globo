# CRUD for goods, good list
class Admin::GoodsController < AdminController
  # -------------------------------------------------------------
  # List of goods
  # GET /admin/goods
  # -------------------------------------------------------------
  def index
    @list = Sap::Good.all
  end

  # -------------------------------------------------------------
  # Get good in goods list
  # GET /admin/goods/:id
  # -------------------------------------------------------------
  def show
    @good = Sap::Good.find(params[:id])
  end

  # -------------------------------------------------------------
  #
  # -------------------------------------------------------------
  def edit
    @good = Sap::Good.find(params[:id])
    @category = Sap::Category.find_child_in_deep(@good.categories, @good.categories.size)
  end

  # -------------------------------------------------------------
  # New good form
  # GET /admin/goods/new
  # -------------------------------------------------------------
  def new
    @good = Sap::Good.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @good }
    end
  end

  # -------------------------------------------------------------
  # Create a good
  # -------------------------------------------------------------
  def create
    @good = Sap::Good.new(params[:sap_good])
    respond_to do |format|
      if ! @good.save
        format.html { redirect_to admin_good_path(@good), notice: 'Test was successfully created.' }
        format.json { render json: @good, status: :created, location: @good }
      else
        format.html { render action: "new" }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end
end
