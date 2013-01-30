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
    #@category = Sap::Category.find_child_in_deep(@good.categories, @good.categories.size)
  end

  # -------------------------------------------------------------
  # New good form
  # GET /admin/goods/new
  # -------------------------------------------------------------
  def new
    @good = Sap::Good.new
    respond_to do |format|
      format.html{ render :layout => !request.xhr? } # new.html.erb
      #format.json { render json: @good }
    end
  end

  # -------------------------------------------------------------
  # Update good
  # PUT /admin/good/1
  # PUT /admin/good/1.json
  # -------------------------------------------------------------
  def update
    @good = Sap::Good.find(params[:id])

    respond_to do |format|
      if @good.update_attributes(params[:admin_good])
        format.html { redirect_to admin_good_path, notice: 'Good list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end

  # -------------------------------------------------------------
  # Create a good
  # -------------------------------------------------------------
  def create
    @good = Sap::Good.new(params[:sap_good])
    respond_to do |format|
      if @good.save
        format.html { redirect_to admin_good_path(@good.id), notice: 'Test was successfully created.' }
        format.json { render json: @good, status: :created, location: @good }
      else
        format.html { render action: "new" }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /admin/good/1
  # DELETE /admin/good/1.json
  def destroy
    @good = Sap::Good.find(params[:id])
    @good.destroy

    respond_to do |format|
      format.html { redirect_to admin_goods_path }
      format.json { head :no_content }
    end
  end
end
