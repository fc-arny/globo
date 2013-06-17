Sap::Application.routes.draw do
  namespace "admin" do
    get '/' => 'index#index'
    resources :goods
    resources :good_lists
  end
end