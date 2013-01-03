class Admin::IndexController < Admin::BaseController
  def index
	  @stores = Sap::Store.all
  end
	def main

	end
end
