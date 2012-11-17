class Staff::IndexController < Staff::BaseController
  def index
	  @stores = Sap::Store.all
  end
	def main

	end
end
