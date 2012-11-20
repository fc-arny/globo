class Store::GoodsController < ApplicationController
  def index
  end

  def list
	  @goods = Sap::Good.all
  end
end
