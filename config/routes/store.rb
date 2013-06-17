Sap::Application.routes.draw do
  scope :module => 'store' do
    match '/goods/(:store(/*categories))'  => 'goods#index', :via => :get      # Goods

    controller :order do
      match 'order' => :index, :via => :get
    end
  end
end