class Staff::GoodListsController < Staff::BaseController
  # GET /staff/good_lists
  # GET /staff/good_lists.json
  def index
    @good_lists = Sap::GoodList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @good_lists }
    end
  end

  # GET /staff/good_lists/1
  # GET /staff/good_lists/1.json
  def show
    @good_list = Sap::GoodList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @staff_good_list }
    end
  end

  # GET /staff/good_lists/new
  # GET /staff/good_lists/new.json
  def new
    @good_list = Sap::GoodList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @good_list }
    end
  end

  # GET /staff/good_lists/1/edit
  def edit
    @good_list = Sap::GoodList.find(params[:id])
  end

  # POST /staff/good_lists
  # POST /staff/good_lists.json
  def create
    @good_list = Sap::GoodList.new do |list|
      p = params[:sap_good_list]
      list.price = p[:price]
      list.store_id = p[:sap_store]
      list.good_id = p[:sap_good]
    end

    respond_to do |format|
      if @good_list.save
        format.html { redirect_to staff_good_lists_path, notice: 'Good list was successfully created.' }
        format.json { render json: @good_list, status: :created, location: @staff_good_list }
      else
        format.html { render action: "new" }
        format.json { render json: @good_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /staff/good_lists/1
  # PUT /staff/good_lists/1.json
  def update
    @staff_good_list = Staff::GoodList.find(params[:id])

    respond_to do |format|
      if @staff_good_list.update_attributes(params[:staff_good_list])
        format.html { redirect_to @staff_good_list, notice: 'Good list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @staff_good_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff/good_lists/1
  # DELETE /staff/good_lists/1.json
  def destroy
    @staff_good_list = Staff::GoodList.find(params[:id])
    @staff_good_list.destroy

    respond_to do |format|
      format.html { redirect_to staff_good_lists_url }
      format.json { head :no_content }
    end
  end
end
