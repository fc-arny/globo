class Admin::IndexController < AdminController
  def index
	  @stores = Sap::Store.all
  end
	def main

	end
end
