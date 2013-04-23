class Admin::GoodListsController < AdminController
  # GET /admin/good_lists
  # GET /admin/good_lists.json
  def index
    @good_lists = Sap::GoodItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @good_lists }
    end
  end

  # GET /admin/good_lists/1
  # GET /admin/good_lists/1.json
  def show
    @good_list = Sap::GoodItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_good_list }
    end
  end

  # GET /admin/good_lists/new
  # GET /admin/good_lists/new.json
  def new
    @good_list = Sap::GoodItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @good_list }
    end
  end

  # GET /admin/good_lists/1/edit
  def edit
    @good_list = Sap::GoodItem.find(params[:id])
  end

  # POST /admin/good_lists
  # POST /admin/good_lists.json
  def create
    @good_list = Sap::GoodItem.new do |list|
      p = params[:sap_good_list]
      list.price = p[:price]
      list.store_id = p[:sap_store]
      list.good_id = p[:sap_good]
    end

    respond_to do |format|
      if @good_list.save
        format.html { redirect_to admin_good_lists_path, notice: 'Good list was successfully created.' }
        format.json { render json: @good_list, status: :created, location: @admin_good_list }
      else
        format.html { render action: "new" }
        format.json { render json: @good_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/good_lists/1
  # PUT /admin/good_lists/1.json
  def update
    @admin_good_list = Admin::GoodItem.find(params[:id])

    respond_to do |format|
      if @admin_good_list.update_attributes(params[:admin_good_list])
        format.html { redirect_to @admin_good_list, notice: 'Good list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_good_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/good_lists/1
  # DELETE /admin/good_lists/1.json
  def destroy
    @admin_good_list = Admin::GoodItem.find(params[:id])
    @admin_good_list.destroy

    respond_to do |format|
      format.html { redirect_to admin_good_lists_url }
      format.json { head :no_content }
    end
  end
end
