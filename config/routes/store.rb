Sap::Application.routes.draw do
  scope :module => 'store' do
    match '/goods/(:store(/*categories))'  => 'goods#index', :via => :get      # Goods

    controller :order do
      get 'order/checkout' => :index
      get 'order' => :list
    end
  end
end